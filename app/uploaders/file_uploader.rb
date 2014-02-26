class FileUploader < CarrierWave::Uploader::Base
  storage :grid_fs

  def store_dir
    "#{model.class.to_s.pluralize.underscore}/#{model.id}/files"
  end
end
