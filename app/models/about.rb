class About < ActiveRecord::Base
  belongs_to :admin

  has_attached_file :photo, styles: { medium: "526x365>" }
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
