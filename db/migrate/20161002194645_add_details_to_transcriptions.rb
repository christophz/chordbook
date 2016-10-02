class AddDetailsToTranscriptions < ActiveRecord::Migration
  def change
    add_column :transcriptions, :level, :string
    add_column :transcriptions, :key, :string
    add_column :transcriptions, :lyrics, :text
    add_column :transcriptions, :video, :string
    add_column :transcriptions, :comment, :text
  end
end
