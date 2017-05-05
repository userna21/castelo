class AddSlugsToTonans < ActiveRecord::Migration[5.0]
  def change
    add_column :tonans, :slug, :string
    add_index :tonans, :slug, :unique => true
  end
end
