require 'slack-notify'
require 'clockwork'
require 'active_support/time'
require 'dotenv'
Dotenv.load

module Clockwork
  client = SlackNotify::Client.new(
    webhook_url: ENV["WEBHOOK_URL"],
    channel: "#yokohama",
    username: "mizuburobot",
    # icon_url: "http://mydomain.com/myimage.png",
    icon_emoji: ":shipit:",
    link_names: 1
  )

  handler do |job|
    puts "Running #{job}"
    client.notify("ととのった〜")
  end

  # every(10.seconds, 'slack_bot')
  every(3.minutes, 'slack_bot_test')
  # every(1.hour, 'hourly.job')
end