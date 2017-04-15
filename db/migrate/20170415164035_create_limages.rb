class CreateLimages < ActiveRecord::Migration[5.0]
  def change
    create_table :limages do |t|
      t.text :url
      t.references :same, foreign_key: true

      t.timestamps
    end
  end
end
