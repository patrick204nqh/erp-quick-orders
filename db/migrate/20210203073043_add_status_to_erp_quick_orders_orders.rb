class AddStatusToErpQuickOrdersOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_quick_orders_orders, :status, :string
  end
end
