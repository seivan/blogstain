class CreateBanneds < ActiveRecord::Migration
  def self.up
    create_table :banneds do |t|
      t.string :ip

      t.timestamps
    end
  end

  def self.down
    drop_table :banneds
  end
end
