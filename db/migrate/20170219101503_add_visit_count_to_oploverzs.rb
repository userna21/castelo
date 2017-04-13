class AddVisitCountToOploverzs < ActiveRecord::Migration[5.0]
  def change
    add_column :oploverzs, :visit_count, :integer, default: 0, null: false
  end
end
