class AddStatusToAbastecimentos < ActiveRecord::Migration[8.0]
  def change
    add_column :abastecimentos, :status, :integer, default: 0, null: false
  end
end
