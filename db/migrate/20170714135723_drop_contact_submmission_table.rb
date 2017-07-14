class DropContactSubmmissionTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :contact_submmissions
  end
end
