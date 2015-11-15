class Post < ActiveRecord::Base
	has_many :posts_images, :dependent => :destroy

  accepts_nested_attributes_for :posts_images,
                                allow_destroy: true
end
