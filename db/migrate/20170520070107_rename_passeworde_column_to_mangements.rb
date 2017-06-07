class RenamePassewordeColumnToMangements < ActiveRecord::Migration[5.0]
  def change
    # [形式] rename_column(テーブル名, 変更前のカラム名, 変更後のカラム名)
   rename_column :mangements, :passeword, :password
  end
end
