class LineUserAuthenticateService

  def initialize(id_token)
    @id_token = id_token
  end

  def call
    channel_id = ENV['CHANNEL_ID']
    res = Net::HTTP.post_form(URI.parse('https://api.line.me/oauth2/v2.1/verify'), { 'id_token' => @id_token, 'client_id' => channel_id })
    @line_user_id = JSON.parse(res.body)['sub']
  end

  def search_user
    User.find_by(line_user_id: @line_user_id)
  end

  private

  attr_reader :line_user_id
end
