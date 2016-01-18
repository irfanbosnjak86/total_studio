class SliderImage < ActiveRecord::Base
  belongs_to :slider

  has_attached_file :image, styles: { medium: "1920x1282#", thumb: "100x100>" },
  :storage => :dropbox,
  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  :dropbox_options => { :path => proc { |style| "images/#{id}/#{style}/#{image.original_filename}" } }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
