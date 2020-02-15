class User < ApplicationRecord
  has_friendship

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def friends?
    self.friends
  end

  def friend_requests?
    self.requested_friends.any?
  end

  def requested_friends?
    self.pending_friends.any?
  end



end
