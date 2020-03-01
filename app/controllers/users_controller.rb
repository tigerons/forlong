class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def show
    @user = get_user(params[:id])
  end

  def update
    @user = get_user(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.js
        format.html { redirect_to @user, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def blocked_users
    @user = current_user
    @blocked = @user.blocked_users
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :surname, :date_of_birth, :gender, :looking_for, :password, :password_confirmation)
  end

  def get_user(user_id)
    User.find(user_id)
  end
end
