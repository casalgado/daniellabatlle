Spree::User.instance_eval do

  has_one :wholesaler, :class_name => "Spree::Wholesaler"

  # scope :wholesale, lambda { includes(:roles).where("spree_roles.name" => "wholesaler") }
  scope :wholesale, -> { includes(:spree_roles).where("#{roles_table_name}.name" => "wholesaler") }


end

Spree::User.class_eval do

  def wholesaler?
    has_spree_role?("wholesaler") && !wholesaler.nil?
  end

end
