class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :type
      t.string :title
      t.text :body
      t.text :body_html
      t.boolean :published
      t.boolean :commented
      t.integer :user_id
      t.string :slug

      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
