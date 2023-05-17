class Driver < ApplicationRecord
  validates_presence_of :name

  has_and_belongs_to_many :crawlers
end
