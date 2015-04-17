class Spree::Wholesaler < ActiveRecord::Base
  partial_updates = false

  belongs_to :user, :class_name => "Spree::User"
  accepts_nested_attributes_for :user

  attr_accessor :use_billing
  validates :company, :buyer_contact, :manager_contact, :phone, :taxid, :presence => true

  delegate_belongs_to :user, :roles
  delegate_belongs_to :user, :email

  def activate!
    get_wholesale_role
    return false if user.spree_roles.include?(@role)
    user.spree_roles << @role
    user.save
  end

  def deactivate!
    get_wholesale_role
    return false unless user.spree_roles.include?(@role)
    user.spree_roles.delete(@role)
    user.save
  end

  def active?
    user && user.has_spree_role?("wholesaler")
  end

  def self.term_options
    %(Net 10, Net 15, Net 30, COD, Credit Card).split(", ")
  end

  private

  def get_wholesale_role
    @role = Spree::Role.where(name: "wholesaler").first_or_create
  end
end
