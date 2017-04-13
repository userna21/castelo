class CreateOploverzs < ActiveRecord::Migration[5.0]
  def change
    create_table :oploverzs do |t|
      t.string :title
      t.text :sinops
      t.text :small
      t.text :medium

      t.timestamps
    end
  end
end
