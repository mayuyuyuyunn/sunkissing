class Admin::UsersController < Admin::applicationController
  def index
    @users = User.all
  end
end
