class AddInvisible < ActiveRecord::Migration
  def self.up
    add_column :pages, :invisible, :boolean
  end
  def self.down
    remove_column :pages, :invisible
  end
end