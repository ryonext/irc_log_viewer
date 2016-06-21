require "rails_helper"

describe IrcLog do
  describe "#build_message_from_log" do
    subject { irc_log.build_message_from_log(log, channel) }
    let(:channel) { create(:channel) }
    let(:irc_log) { IrcLog.new }

    context "Message by user" do
      let(:log) { "12:51 sushi-man: Hello world" }

      it "creates message record" do
        expect(subject.class).to eq Message
        expect(subject.text).to eq "Hello world"
      end
    end
    context "System message" do
      let(:log) { "08:39 You have joined the channel" }
      it "does not creates message record" do
        expect(subject).to be_nil
      end
    end
  end
end
