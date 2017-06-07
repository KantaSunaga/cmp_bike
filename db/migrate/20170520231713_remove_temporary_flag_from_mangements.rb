class RemoveTemporaryFlagFromMangements < ActiveRecord::Migration[5.0]
  def change
    remove_column :mangements, :temporary_flag, :boolean
  end
end
