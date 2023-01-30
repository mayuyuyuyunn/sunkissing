class UsersController < ApplicationController
  require 'net/http'
  require 'uri'

  def new; end

  def create
    id_token = params[:idToken]
<<<<<<< HEAD
    channel_id = XXXXXXXXXXXXX
=======
    channel_id = 1657853635
>>>>>>> 72883c3714beec23e83a9e6f4e73d4c39c323044
    res = Net::HTTP.post_form(URI.parse('https://api.line.me/oauth2/v2.1/verify'), {'id_token'=>id_token, 'client_id'=>channel_id})
    line_user_id = JSON.parse(res.body)["sub"]
    user = User.find_by(line_user_id: line_user_id)
    if user.nil?
      user = User.create(line_user_id: line_user_id)
    end
    session[:user_id] = user.id
    render :json => user
  end
end
