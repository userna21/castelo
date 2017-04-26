class CreateOstreams < ActiveRecord::Migration[5.0]
  def change
    create_table :ostreams do |t|
      t.text :link
      t.references :oploverz, foreign_key: true

      t.timestamps
    end
  end
end
