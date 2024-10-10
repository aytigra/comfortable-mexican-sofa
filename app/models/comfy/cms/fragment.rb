# frozen_string_literal: true

class Comfy::Cms::Fragment < ActiveRecord::Base

  self.table_name = "comfy_cms_fragments"

  serialize :content, coder: Psych

  attr_reader :files

  # -- Callbacks ---------------------------------------------------------------
  before_save :remove_attachments, :add_attachments

  # -- Relationships -----------------------------------------------------------
  belongs_to :record, polymorphic: true, touch: true
  has_many_attached :attachments

  # -- Validations -------------------------------------------------------------
  validates :identifier,
    presence:   true,
    uniqueness: { scope: :record, case_sensitive: true }

  # -- Instance Methods --------------------------------------------------------

  # Temporary accessor for uploaded files. We can only attach to persisted
  # records so we are deffering it to the after_save callback.
  # Note: hijacking dirty tracking to force trigger callbacks later.
  def files=(files)
    @files = [files].flatten.compact
    content_will_change! if @files.present?
  end

  def file_ids_destroy=(ids)
    @file_ids_destroy = [ids].flatten.compact
    content_will_change! if @file_ids_destroy.present?
  end

protected

  def remove_attachments
    return unless @file_ids_destroy.present?
    attachments.where(id: @file_ids_destroy).destroy_all
  end

  def add_attachments
    return if @files.blank?

    # rdsun: remove existing attachments first
    attachments.destroy_all

    # If we're dealing with a single file
    if tag == "file"
      @files = [@files.first]
      attachments&.clear
    end

    attachments.attach(@files)
  end

end
