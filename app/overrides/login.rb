Deface::Override.new(:virtual_path  => "spree/user_sessions/new",
                     :insert_after  => "erb[loud]:contains('link_to Spree.t(:create_a_new_account)')",
                     :text          => " | <%= link_to Spree.t(:create_a_new_wholesaler, default: 'Create a new Wholesaler'), new_wholesaler_path %>",
                     :name          => "session_new_wholesale")
