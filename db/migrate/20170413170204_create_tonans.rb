class CreateTonans < ActiveRecord::Migration[5.0]
  def change
    create_table :tonans do |t|
      t.string :title
      t.text :sinop
      t.text :small
      t.text :medium

      t.timestamps
    end
  end
end
