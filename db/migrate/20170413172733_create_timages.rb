class CreateTimages < ActiveRecord::Migration[5.0]
  def change
    create_table :timages do |t|
      t.text :url
      t.references :tonan, foreign_key: true

      t.timestamps
    end
  end
end
