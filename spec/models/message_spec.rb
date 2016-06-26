require "rails_helper"

describe Message do
  describe "#generate_key" do
    subject { message.save }
    let(:message) { build(:message, published_at: 3.minutes.ago, text: Faker::Lorem.sentence) }

    it "creates message record" do
      expect { subject }.to change(message.message_key)
    end
  end
end
