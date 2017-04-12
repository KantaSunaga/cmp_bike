class ChangeDatatypePictureOfBikes < ActiveRecord::Migration[5.0]
  def change
     change_column :bikes, :picture, :string
  end
end
