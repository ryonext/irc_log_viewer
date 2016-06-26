class IrcLog
  include ActiveModel::Model
  attr_accessor :log_file, :channel_name, :date

  def save
    channel = Channel.find_or_create_by(name: channel_name)
    date_str = /^(\d\d\d\d-\d\d-\d\d)?.+$/.match(log_file.original_filename)[1]
    # Open file
    # each lines
    messages = File.foreach(log_file.tempfile).map do |line|
      build_message_from_log(line, channel, date_str)
    end.compact!
    # import record
    #Message.import(messages)
    messages.each {|m| m.save }
  end

  def build_message_from_log(log, channel, date_str)
    result = /^(\d\d:\d\d)? (.+)?: (.+)?$/.match(log)
    unless result
      return nil
    end
    time = result[1]
    name = result[2]
    text = result[3]
    user = User.find_or_create_by(name: name)
    Message.new(
      user: user,
      text: text,
      channel: channel,
      published_at: Time.parse("{date_str} #{time}")
    )
  end
end
