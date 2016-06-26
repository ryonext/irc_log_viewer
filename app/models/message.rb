class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel

  scope :order_by_published, -> { order(:published_at) }
end
