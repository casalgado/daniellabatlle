class CreateSpreeWholesalers < ActiveRecord::Migration
  def self.up
    create_table :spree_wholesalers do |t|
      t.references :user
      t.string :company
      t.string :buyer_contact
      t.string :manager_contact
      t.string :phone
      t.string :fax
      t.string :resale_number
      t.string :taxid
      t.string :web_address
      t.string :terms
      t.string :alternate_email
      t.text   :notes
      t.timestamps
    end
    add_column :spree_orders,   :wholesale,       :boolean, :default   => false
    add_column :spree_variants, :wholesale_price, :decimal, :precision => 8, :scale => 2, :null => false, :default => 0
  end

  def self.down
    remove_column :spree_variants, :wholesale_price
    remove_column :spree_orders,   :wholesale
    drop_table :spree_wholesalers
  end
end
