class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def blocked_users
    @user = current_user
    @blocked = @user.blocked_users
  end

end
