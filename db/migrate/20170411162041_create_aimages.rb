class CreateAimages < ActiveRecord::Migration[5.0]
  def change
    create_table :aimages do |t|
      t.text :url
      t.references :awsub, foreign_key: true

      t.timestamps
    end
  end
end
