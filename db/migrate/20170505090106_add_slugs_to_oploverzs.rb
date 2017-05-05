class AddSlugsToOploverzs < ActiveRecord::Migration[5.0]
  def change
    add_column :oploverzs, :slug, :string
    add_index :oploverzs, :slug, :unique => true
  end
end
