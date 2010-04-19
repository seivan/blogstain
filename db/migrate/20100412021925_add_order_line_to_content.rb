class AddOrderLineToContent < ActiveRecord::Migration
  def self.up
    add_column :contents, :order_line, :integer
  end

  def self.down
    remove_column :contents, :order_line
  end
end
