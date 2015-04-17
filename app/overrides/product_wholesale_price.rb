Deface::Override.new(
  :virtual_path  => 'spree/products/_cart_form',
  :name          => 'product_wholesale_price',
  :insert_bottom => "#product-price",
  :partial       => "spree/hooks/product_wholesale_price",
  :disabled      => false
)

Deface::Override.new(
  :virtual_path     => 'spree/checkout/_delivery',
  :name             => 'delivery_product_wholesale_price',
  :replace_contents => ".shipment .item-price",
  :text             => "<%= item.line_item.single_money.to_html %>",
  :disabled         => false
)
