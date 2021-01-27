class Feed < ApplicationRecord
  has_and_belongs_to_many :briefing

  def to_s
    @name
  end
end
