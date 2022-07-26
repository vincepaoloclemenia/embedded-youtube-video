class AddAvatarToProductControls < ActiveRecord::Migration[6.1]
  def change
    add_column :product_controls, :avatar, :string
  end
end
