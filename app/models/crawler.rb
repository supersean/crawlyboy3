class Crawler < ApplicationRecord
  validates_presence_of :drivers, :keywords

  has_and_belongs_to_many :drivers
end
