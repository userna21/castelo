class CreateVimages < ActiveRecord::Migration[5.0]
  def change
    create_table :vimages do |t|
      t.text :url
      t.references :movieu, foreign_key: true

      t.timestamps
    end
  end
end
