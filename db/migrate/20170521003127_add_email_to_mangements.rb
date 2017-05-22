class AddEmailToMangements < ActiveRecord::Migration[5.0]
  def change
    add_column :mangements, :email, :string, :unique => true
  end
end
