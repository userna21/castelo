class CreateOimages < ActiveRecord::Migration[5.0]
  def change
    create_table :oimages do |t|
      t.text :url
      t.references :oploverz, foreign_key: true

      t.timestamps
    end
  end
end
