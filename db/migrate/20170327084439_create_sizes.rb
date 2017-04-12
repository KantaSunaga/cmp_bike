class CreateSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.integer :size
      t.integer :min_height
      t.integer :max_height
      t.integer :weight

      t.timestamps
    end
  end
end
