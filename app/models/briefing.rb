class Briefing < ApplicationRecord
  has_and_belongs_to_many :feed
  belongs_to :bot
  belongs_to :user
end
