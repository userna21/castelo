class CreateMovieus < ActiveRecord::Migration[5.0]
  def change
    create_table :movieus do |t|
      t.string :title
      t.text :gstream
      t.text :nstream
      t.text :lstream
      t.text :mstream

      t.timestamps
    end
  end
end
