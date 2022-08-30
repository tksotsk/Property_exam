class ChangeColumnOnProperty < ActiveRecord::Migration[6.0]
  def change
    change_column_null :properties, :property, false, "物件名"

  end
end
