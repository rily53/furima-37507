class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string      :post_code       , null: false
      t.integer     :area_id         , null: false
      t.string      :municipalities  , null: false
      t.string      :address         , null: false
      t.string      :building_name
      t.string      :phone           , null: false
      t.references  :buyer           , null: false, foreign_key: true

      t.timestamps
    end
  end
end
