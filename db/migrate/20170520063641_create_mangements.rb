class CreateMangements < ActiveRecord::Migration[5.0]
  def change
    create_table :mangements do |t|
      t.string :user_name
      t.string :email
      t.string :passeword

      t.timestamps
    end
  end
end
