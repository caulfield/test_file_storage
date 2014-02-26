class Asset
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :name, type: String

  mount_uploader :file, FileUploader

  validates :name, :file, presence: true

  index({created_at: 1})
end
