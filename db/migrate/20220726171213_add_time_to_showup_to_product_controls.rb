class AddTimeToShowupToProductControls < ActiveRecord::Migration[6.1]
  def change
    add_column :product_controls, :time_to_showup, :integer
    add_column :product_controls, :active, :boolean, default: true
  end
end
