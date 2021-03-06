# encoding: utf-8

class NeighborhoodPhotoUploader < CarrierWave::Uploader::Base

  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    # add the S3 link
  end
end
