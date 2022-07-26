class CreateProductControls < ActiveRecord::Migration[6.1]
  def change
    create_table :product_controls do |t|
      t.string :name
      t.belongs_to :product

      t.timestamps
    end
  end
end
