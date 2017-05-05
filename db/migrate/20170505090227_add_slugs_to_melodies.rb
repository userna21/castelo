class AddSlugsToMelodies < ActiveRecord::Migration[5.0]
  def change
    add_column :melodies, :slug, :string
    add_index :melodies, :slug, :unique => true
  end
end
