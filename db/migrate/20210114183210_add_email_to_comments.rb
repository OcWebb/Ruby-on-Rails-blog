class AddEmailToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :email, :string
  end
end
