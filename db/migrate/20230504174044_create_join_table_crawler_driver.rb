class CreateJoinTableCrawlerDriver < ActiveRecord::Migration[7.0]
  def change
    create_join_table :crawlers, :drivers do |t|
      # t.index [:crawler_id, :driver_id]
      # t.index [:driver_id, :crawler_id]
    end
  end
end
