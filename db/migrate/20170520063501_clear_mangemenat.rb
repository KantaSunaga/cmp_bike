class ClearMangemenat < ActiveRecord::Migration[5.0]
  def change
    drop_table :mangements
  end
end
