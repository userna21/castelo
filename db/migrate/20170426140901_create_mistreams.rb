class CreateMistreams < ActiveRecord::Migration[5.0]
  def change
    create_table :mistreams do |t|
      t.text :url
      t.references :melody, foreign_key: true

      t.timestamps
    end
  end
end
