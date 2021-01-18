class DeletePosts < ActiveRecord::Migration[6.0]
  def up
    drop_table :post
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
