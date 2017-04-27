class AddDstreamToMelodies < ActiveRecord::Migration[5.0]
  def change
    add_column :melodies, :dstream, :text
  end
end
