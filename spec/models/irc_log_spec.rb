require "rails_helper"

describe IrcLog do
  describe "#build_message_from_log" do
    subject { irc_log.build_message_from_log(log) }

    let(:irc_log) { IrcLog.new }
    let(:log) { "12:51 sushi-man: Hello world" }

    it "creates message record" do
      expect(subject.class).to eq Message
      expect(subject.text).to eq "Hello world"
    end
  end
end
