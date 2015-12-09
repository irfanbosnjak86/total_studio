class Post < ActiveRecord::Base
	has_many :post_images, :dependent => :destroy
  has_many :videos, :dependent => :destroy

  accepts_nested_attributes_for :post_images, :allow_destroy => true
  accepts_nested_attributes_for :videos, :allow_destroy => true
end
