class FileGroup < ActiveRecord::Base
  has_many :documents, dependent: :destroy
  translates :name, :description
end
