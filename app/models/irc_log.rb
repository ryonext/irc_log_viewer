class IrcLog
  include ActiveModel::Model
  attr_accessor :log_file, :channel_name, :date

  def save
    channel = Channel.find_or_create_by(name: channel_name)
    date_str = /^(\d\d\d\d-\d\d-\d\d)?.+$/.match(log_file.original_filename)[1]
    # Open file
    # each lines
    File.foreach(log_file.tempfile) do |line|
      build_message_from_log(line, channel, date_str)
    end
    # fetch each object
    # import record
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
    Message.create(
      user: user,
      text: text,
      channel: channel,
      published_at: Time.parse("{date_str} #{time}")
    )
  end
end
