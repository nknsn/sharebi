class Cosmetic < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  
  def get_image
    if image.attached?
      image
    else
      '1907768.jpg'
    end
  end
  
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/1907768.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
