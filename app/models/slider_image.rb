class SliderImage < ActiveRecord::Base
  belongs_to :slider

  has_attached_file :image, styles: { medium: "1920x1282#", thumb: "100x100>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
