class PostImage < ActiveRecord::Base
  belongs_to :post

  has_attached_file :photo, styles: { index: "300x300#" }
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
    validates :photo, presence: true

end
