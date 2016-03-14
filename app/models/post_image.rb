class PostImage < ActiveRecord::Base
  belongs_to :post

  has_attached_file :photo, styles: { index: "300x300#" },
  :storage => :dropbox,
  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  :dropbox_options => { :path => proc { |style| "images/#{id}/#{style}/#{photo.original_filename}" } }
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
    validates :photo, presence: true

end
