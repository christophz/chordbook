class AddPropertiesToTranscribers < ActiveRecord::Migration
  def change
    add_column :transcribers, :name, :string
    add_column :transcribers, :instruments, :text
    add_column :transcribers, :facebook_link, :string
    add_column :transcribers, :twitter_link, :string
    add_column :transcribers, :bandcamp_link, :string
    add_column :transcribers, :soundcloud_link, :string
  end
end
