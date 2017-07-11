class Document < ActiveRecord::Base
  belongs_to :file_group

  has_attached_file :file,
                    :url => "/assets/products/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:basename.:extension"
  validates_attachment :file, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
