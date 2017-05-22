class RemoveEmailFromMangements < ActiveRecord::Migration[5.0]
  def change
    remove_column :mangements, :email, :string
  end
end
