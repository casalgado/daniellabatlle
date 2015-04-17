class AbilityDecorator
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :index,  Spree::Wholesaler
    can :new,    Spree::Wholesaler
    can :create, Spree::Wholesaler
    can :read,   Spree::Wholesaler do |resource|
      resource.user == user || user.has_spree_role?(:admin)
    end
    can :update, Spree::Wholesaler do |resource|
      resource.user == user || user.has_spree_role?(:admin)
    end
  end
end
