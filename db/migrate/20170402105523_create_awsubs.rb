class CreateAwsubs < ActiveRecord::Migration[5.0]
  def change
    create_table :awsubs do |t|
      t.string :title
      t.text :sinop
      t.text :asmall
      t.text :amedium

      t.timestamps
    end
  end
end
