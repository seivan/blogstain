class CreateBannedIps < ActiveRecord::Migration
  def self.up
    create_table :banned_ips do |t|
      t.string :ip

      t.timestamps
    end
  end

  def self.down
    drop_table :banned_ips
  end
end
