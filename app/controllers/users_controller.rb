class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
     @user = current_user
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.js
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        @user.save!
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
    params.require(:user).permit(:email, :name, :surname, :date_of_birth, :description, :password, :password_confirmation)
  end

  def get_user(user_id)
    @user = current_user
  end
end
