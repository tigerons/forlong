class AddConfirmableToDevise < ActiveRecord::Migration[5.2]
  def up
    add_index :users, :confirmation_token, unique: true
    User.update_all confirmed_at: DateTime.now    
  end
end
