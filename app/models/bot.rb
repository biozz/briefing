class Bot < ApplicationRecord
  has_and_belongs_to_many :briefing
  belongs_to :user
end
