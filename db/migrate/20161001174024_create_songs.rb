class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :musician
      t.string :originalkey

      t.timestamps null: false
    end
  end
end
