namespace :sunscreen_remind_task do
  desc "日焼け止めの塗り直し通知を送る"
  task send_remind_line: :environment do
    check_type = ['炎天下でのレジャー・マリンスポーツなど', '非常に強い紫外線の場所に行く・紫外線に過敏な方']
    schedules = Schedule.schedule_at_today
    time = Time.now
    return false if time.hour.between?(17, 23)
    client = Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }
    remind = Remind.new
    schedules.each do |schedule|
      puts 'LINEのクライアント'
      puts client
      puts 'スケジュール'
      p schedule
      puts '何時に家出た？'
      p schedule.leave_home_time.hour
      puts '今何時'
      puts time.hour
      puts '2時間おきに送る？'
      puts check_type.include?(schedule.odekake_type.name)
      puts (time.hour == schedule.leave_home_time.hour + 2) || (time.hour == schedule.leave_home_time.hour + 4) || (time.hour == schedule.leave_home_time.hour + 6) || (time.hour == schedule.leave_home_time.hour + 8) || (time.hour == schedule.leave_home_time.hour + 10)
      puts '3時間おきに送る？'
      puts (time.hour == schedule.leave_home_time.hour + 3) || (time.hour == schedule.leave_home_time.hour + 6) || (time.hour == schedule.leave_home_time.hour + 9)
      if check_type.include?(schedule.odekake_type.name)
        if (time.hour == schedule.leave_home_time.hour + 2) || (time.hour == schedule.leave_home_time.hour + 4) || (time.hour == schedule.leave_home_time.hour + 6) || (time.hour == schedule.leave_home_time.hour + 8) || (time.hour == schedule.leave_home_time.hour + 10)
          line_user_id = schedule.user.line_user_id
          message = { type: 'text',
                      text: remind.message  }
          stamp = { type: 'sticker',
                    packageId: '789',
                    stickerId: remind.stamp }
          client.push_message(line_user_id, message)
          client.push_message(line_user_id, stamp)
        end
      else
        if (time.hour == schedule.leave_home_time.hour + 3) || (time.hour == schedule.leave_home_time.hour + 6) || (time.hour == schedule.leave_home_time.hour + 9)
          line_user_id = schedule.user.line_user_id
          message = { type: 'text',
                      text: remind.message  }
          stamp = { type: 'sticker',
                    packageId: '789',
                    stickerId: remind.stamp }
          client.push_message(line_user_id, message)
          client.push_message(line_user_id, stamp)
        end
      end
    end
  end
end
