class AddSlugsToAwsubs < ActiveRecord::Migration[5.0]
  def change
    add_column :awsubs, :slug, :string
    add_index :awsubs, :slug, :unique => true
  end
end
