class CreateSames < ActiveRecord::Migration[5.0]
  def change
    create_table :sames do |t|
      t.string :title
      t.text :lsmall1
      t.text :lsmall2
      t.text :lmedium1
      t.text :lmedium2

      t.timestamps
    end
  end
end
