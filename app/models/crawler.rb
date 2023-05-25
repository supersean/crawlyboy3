class Crawler < ApplicationRecord
  validates_presence_of :drivers, :keywords

  has_and_belongs_to_many :drivers
  belongs_to :user

  scope :alphabetical_sync, -> { order(keywords: :desc) }
  # scope :alphabetical_async, -> { alphabetical_sync.load_async }

  # refresh_all_crawlers_async = -> { broadcast_update_later_to("crawlers", target: "crawlers", partial: "crawlers/list", locals: { crawlers: Crawler.alphabetical_async.to_a }) }
  # refresh_all_crawlers_sync = -> { broadcast_update_to "crawlers", target: "crawlers", partial: "crawlers/list", locals: { crawlers: Crawler.alphabetical_sync } }
  #
  # after_create_commit refresh_all_crawlers_async
  # after_update_commit refresh_all_crawlers_async
  # after_destroy_commit refresh_all_crawlers_sync

end
