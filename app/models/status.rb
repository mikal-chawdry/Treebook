class Status < ActiveRecord::Base
  attr_accessible :content, :user_id # Determines what attributes are allowed to be passed through a form
  belongs_to :user
  validates :content, presence: true, length: {minimum: 2, message: "Status must be at least 2 letters long"}
  validates :user_id, presence: true
end
