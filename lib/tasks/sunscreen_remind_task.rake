namespace :sunscreen_remind_task do
  desc '日焼け止めの塗り直し通知を送る'
  task send_remind_line: :environment do
    check_type = ['炎天下でのレジャー・マリンスポーツなど', '非常に強い紫外線の場所に行く・紫外線に過敏な方']
    schedules = Schedule.schedule_at_today
    time = Time.now
    # 17時から23時の間はLINEを送らない
    return false if time.hour.between?(17, 23)

    client = Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end
    remind = Remind.new
    schedules.each do |schedule|
      if schedule.odekake_type.name == '今日は1歩も外に出ません。1日中お家で過ごす予定。'
        if time.hour == 16
          line_user_id = schedule.user.line_user_id
          message = { type: 'text',
                      text: '今日はお家で過ごす予定だったのに、日焼け止めを塗るなんて偉すぎます！日没までにあともう1回塗り直せば100点です💮' }
          client.push_message(line_user_id, message)
        end
      elsif check_type.include?(schedule.odekake_type.name)
        if (time.hour == schedule.leave_home_time.hour + 2) || (time.hour == schedule.leave_home_time.hour + 4) || (time.hour == schedule.leave_home_time.hour + 6) || (time.hour == schedule.leave_home_time.hour + 8) || (time.hour == schedule.leave_home_time.hour + 10)
          line_user_id = schedule.user.line_user_id
          message = { type: 'text',
                      text: remind.message  }
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
