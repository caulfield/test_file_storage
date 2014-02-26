class Asset
  include Mongoid::Document

  field :name, type: String
  mount_uploader :file, FileUploader

  validates :name, :file, presence: true
end
