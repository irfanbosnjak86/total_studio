class PostImage < ActiveRecord::Base
  belongs_to :post

  has_attached_file :photo, styles: { medium: "800x640>", index: "355x355#", thumb: "100x100>" }
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
