class CreateTranscriptions < ActiveRecord::Migration
  def change
    create_table :transcriptions do |t|
      t.references :song, index: true, foreign_key: true
      t.references :transcriber, index: true, foreign_key: true
    end
  end
end
