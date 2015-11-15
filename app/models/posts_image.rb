class PostsImage < ActiveRecord::Base
  belongs_to :post

  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100>" },
  :storage => :dropbox,
  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  :dropbox_options => { :path => proc { |style| "images/#{id}/#{style}/#{image.original_filename}" } }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
