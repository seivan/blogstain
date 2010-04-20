class AddLineOrderToContent < ActiveRecord::Migration
  def self.up
    add_column :contents, :line_order, :integer
  end

  def self.down
    remove_column :contents, :line_order
  end
end
