class Friendship < ApplicationRecord
  # - RELATIONS
  belongs_to :friender, class_name: "User"
  belongs_to :friended, class_name: 'User'



  # - VALIDATIONS
  validates_presence_of :user_id, :friend_id
  validate :user_is_not_equal_friend
  validates_uniqueness_of :user_id, scope: [:friend_id]

  def is_mutual
    self.friend.friends.include?(self.user)
  end

  private
  def user_is_not_equal_friend
    errors.add(:friend, "can't be the same as the user") if self.user == self.friend
  end

end
