class Status < ActiveRecord::Base
  attr_accessible :content, :user_id # Determines what attributes are allowed to be passed through a form
  belongs_to :user
end
