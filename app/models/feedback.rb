class Feedback < ApplicationRecord
  validates_presence_of :email
  validates_presence_of :text
end
