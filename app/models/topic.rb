class Topic < ActiveRecord::Base
  belongs_to :board
  belongs_to :author, :class_name => "User"
end
