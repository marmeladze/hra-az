class ImageUploader < CarrierWave::Uploader::Base
  
  include Cloudinary::CarrierWave

  process :tags => ['post_picture']
  
  version :standard do
    process :resize_to_fill => [100, 150, :north]
  end

  version :article do
    resize_to_fit(400, 1100)
  end  

  version :thumbnail do
    resize_to_fit(50, 50)
  end

  def public_id
    return model.title.parameterize
  end 
end
