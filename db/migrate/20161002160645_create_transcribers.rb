class CreateTranscribers < ActiveRecord::Migration
  def change
    create_table :transcribers do |t|
      t.string :name
      t.text :instruments
      t.string :email
      t.string :facebook_link

      t.timestamps null: false
    end
  end
end
