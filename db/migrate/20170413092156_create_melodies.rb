class CreateMelodies < ActiveRecord::Migration[5.0]
  def change
    create_table :melodies do |t|
      t.string :mtitle
      t.text :msinop
      t.text :msmall
      t.text :mmedium

      t.timestamps
    end
  end
end
