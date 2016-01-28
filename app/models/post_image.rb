class PostImage < ActiveRecord::Base
  belongs_to :post

  has_attached_file :photo, styles: { medium: "856x570>", index: "355x355#", thumb: "100x100>" },
  :storage => :dropbox,
  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  :dropbox_options => { :path => proc { |style| "images/#{id}/#{style}/#{photo.original_filename}" } }
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
