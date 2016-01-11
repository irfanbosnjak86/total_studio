class Slider < ActiveRecord::Base
  belongs_to :admin
  has_many :slider_images, :dependent => :destroy

  accepts_nested_attributes_for :slider_images, :allow_destroy => true
end
