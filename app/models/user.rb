class User < ApplicationRecord
  has_friendship

  serialize :blocked_users, Array
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

  def blocked_friends?
    self.blocked_friends.any?
  end

  def blocked_user_email(user_id)
    User.find_by(id: user_id).email
  end

  def blocked_user_id(user_id)
    User.find_by(id: user_id)
  end

  def not_friends
    users_not_be_a_friends = []
    User.all.each do |user|
      if( (self.friends_with?(user) == false) &&
          (self != user && self.friends.include?(user) == false) &&
          (self.pending_friends.include?(user) == false) &&
          (self.requested_friends.include?(user) == false) &&
          (self.blocked_friendships.include?(user) == false) )
        users_not_be_a_friends.push user
      end
    end
    return users_not_be_a_friends
  end

end
