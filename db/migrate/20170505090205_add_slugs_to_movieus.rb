class AddSlugsToMovieus < ActiveRecord::Migration[5.0]
  def change
    add_column :movieus, :slug, :string
    add_index :movieus, :slug, :unique => true
  end
end
