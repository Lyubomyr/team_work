class Comment < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :text
end
