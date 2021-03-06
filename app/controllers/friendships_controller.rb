class FriendshipsController < ApplicationController

  def index
    @user = current_user
    @friends = @user.friends
    @requests = @user.requested_friends
  end

  def show

  end

  def requested_friends
    @user = current_user
    @pending = @user.pending_friends
  end

  def friends_request
    @user = current_user
    @requests = @user.requested_friends
  end

  def blocked_friendship
    @user = current_user
    @blocked = @user.blocked_friendship
  end

  def create
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.friend_request(friend)
    respond_to do |format|
      format.js
      format.html { redirect_to @user, notice: 'Wysłano zaproszenie do grona znajomych' }
    end
  end

  def accept
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.accept_request(friend)
    respond_to do |format|
      format.html { redirect_to @user, notice: 'Zaakceptowano zaproszenie' }
      format.js
    end
  end

  def reject
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.decline_request(friend)
    respond_to do |format|
      format.js
      format.html { redirect_to @user, notice: 'Anulowano zaproszenie' }
    end
  end

  def remove
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.remove_friend(friend)
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Usunięto z grona znajoych' }
      format.js
    end
  end


  def block
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.block_friendship(friend)
    @user.blocked_users << friend.id
    @user.save!
    redirect_to users_path
  end

  def unblock
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.unblock_friendship(friend)
    @user.blocked_users.delete(friend.id)
    @user.save!
    redirect_to users_blocked_users_path
  end

  def has_friend?
    @user = current_user
    friend = User.find_by(id: params[:id])
    @user.friends_with?(friend)
    redirect_to users_path
  end
end
