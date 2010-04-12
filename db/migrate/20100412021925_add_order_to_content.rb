class AddOrderToContent < ActiveRecord::Migration
  def self.up
    add_column :contents, :order, :integer
  end

  def self.down
    remove_column :contents, :order
  end
end
