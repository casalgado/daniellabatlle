Deface::Override.new(
  :virtual_path     => 'spree/admin/variants/_form',
  :name             => 'variant_form_wholesale_price',
  :insert_after     => "[data-hook='cost_price']",
  :partial          => "spree/admin/variants/wholesale_price",
  :disabled         => false
)

# insert_after :admin_tabs,                 'admin/hooks/wholesale_tab'
Deface::Override.new(
  :virtual_path  => "spree/layouts/admin",
  :name          => "admin-wholesale-tab",
  :insert_bottom => "#main-sidebar",
  :partial       => "spree/admin/hooks/wholesale_tab",
  :disabled      => false
)
