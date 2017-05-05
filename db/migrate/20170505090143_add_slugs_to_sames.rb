class AddSlugsToSames < ActiveRecord::Migration[5.0]
  def change
    add_column :sames, :slug, :string
    add_index :sames, :slug, :unique => true
  end
end
