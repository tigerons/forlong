class FriendshipsController < ApplicationController

  def index
    @user = current_user
    @friends = @user.friends
    @requests = @user.requested_friends
  end

  def requested_friends
    @user = current_user
    @pending = @user.pending_friends
  end

  def blocked_friendship
    @user = current_user
    @blocked = @user.blocked_friendship
  end

  def create
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.friend_request(friend)
    flash[:notice] = "Wyslano zaproszenie do grona znajomych"
    redirect_to friendships_path
  end

  def accept
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.accept_request(friend)
    flash[:notice] = "Zaakceptowano zaproszenie"
    redirect_to users_path
  end

  def reject
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.decline_request(friend)
    redirect_to users_path
  end

  def remove
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.remove_friend(friend)
    redirect_to users_path
  end


  def block
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.block_friendship(friend)
    @user.blocked_users << friend
    @user.save!
    redirect_to users_path
  end

  def unblock
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.unblock_friendship(friend)
    @user.blocked_users.delete(friend)
    @user.save!
  end

  def has_friend?
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.friends_with?(friend)
    redirect_to users_path
  end
end
