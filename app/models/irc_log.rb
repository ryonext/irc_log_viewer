class IrcLog
  include ActiveModel::Model
  attr_accessor :log_file, :channel_name, :date

  def save
    channel = Channel.find_or_create_by(name: channel_name)
    # Open file
    # each lines
    File.foreach(log_file.tempfile) do |line|
      build_message_from_log(line, channel)
    end
    # fetch each object
    # import record
  end

  def build_message_from_log(log, channel)
    result = /^(\d\d:\d\d)? (.+)?: (.+)?$/.match(log)
    unless result
      return nil
    end
    time = result[1]
    user = result[2]
    text = result[3]
    Message.new(text: text, channel: channel)
  end
end
