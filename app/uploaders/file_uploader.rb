class FileUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(txt csv)
  end

  def filename
    "#{Time.now.to_i}-#{original_filename}" if original_filename.present?
  end

end