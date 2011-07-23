class CreateReminders < ActiveRecord::Migration
  def self.up
    create_table :reminders do |t|
      t.text :content
      t.string :twitter_handle
      t.datetime :when
      t.boolean :dm, :default => false
      t.boolean :done, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :reminders
  end
end
