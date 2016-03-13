class About < ActiveRecord::Base
  belongs_to :admin

  has_attached_file :photo, styles: { medium: "526x365>" }, 
  :storage => :dropbox,
  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  :dropbox_options => { :path => proc { |style| "images/#{id}/#{style}/#{photo.original_filename}" } }
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
