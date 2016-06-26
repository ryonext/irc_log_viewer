class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel

  scope :order_by_published, -> { order("published_at desc") }
  before_validation :generate_key
  validates :message_key, uniqueness: true

  private

    def generate_key
      unless message_key
        self.message_key = published_at.to_s + Digest::SHA1.hexdigest(text)
      end
    end
end
