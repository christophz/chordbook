class AddTranscriberIdToSongsAndTranscriptions < ActiveRecord::Migration
  def change
    add_column :songs, :transcriber_id, :integer
    add_column :transcriptions, :transcriber_id, :integer
  end
end
