desc "日焼け止めの塗り直し通知を送る(Heroku)"
task :send_remind_line => :environment do
  check_type = ['炎天下でのレジャー・マリンスポーツなど', '非常に強い紫外線の場所に行く・紫外線に過敏な方']
  schedules = Schedule.schedule_at_today
  time = Time.now
  client = Line::Bot::Client.new { |config|
          config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
          config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      }
  schedules.each do |schedule|
    if check_type.include?(schedule.odekake_type.name)
      if (time.hour == schedule.leave_home_time.hour + 2) || (time.hour == schedule.leave_home_time.hour + 4) || (time.hour == schedule.leave_home_time.hour + 6) || (time.hour == schedule.leave_home_time.hour + 8) || (time.hour == schedule.leave_home_time.hour + 10)
        line_user_id = schedule.user.line_user_id
        message = { type: 'text',
                    text: '日焼け止めの塗り直し時間です！(2)'  }
        client.push_message(line_user_id, message)
      end
    else
      if (time.hour == schedule.leave_home_time.hour + 3) || (time.hour == schedule.leave_home_time.hour + 6) || (time.hour == schedule.leave_home_time.hour + 9)
        line_user_id = schedule.user.line_user_id
        message = { type: 'text',
                    text: '日焼け止めの塗り直し時間です！(3)'  }
        client.push_message(line_user_id, message)
      end
    end
  end
end
