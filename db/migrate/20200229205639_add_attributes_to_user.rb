class AddAttributesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :gender, :string
    add_column :users, :looking_for, :string
    add_column :users, :description, :string
  end
end
