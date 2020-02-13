class UsersController < ApplicationController

  def index
  end

  def friend_request
    if current_user.friend_request(@user)
      flash[:notice] = "Wyslano zaproszenie do grona znajomych"
      redirect_to root_url
    else
      flash[:error] = "Error occurred when adding friend."
      redirect_to root_url
    end
  end

  def friends_with
    if current_user.friends_with?(:friendship_id => user)
      flash[:notice] = "true"
    end
  end
end
