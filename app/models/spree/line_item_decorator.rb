Spree::LineItem.class_eval do

  delegate_belongs_to :variant, :wholesale_price
  delegate_belongs_to :variant, :is_wholesaleable?
  # delegate_belongs_to :order

  before_save :wholesale_line_item


  def copy_price
    if variant
      self.price = (order.is_wholesale? && variant.is_wholesaleable? ? variant.wholesale_price : variant.price) if price.nil?
      self.cost_price = variant.cost_price if cost_price.nil?
      self.currency = variant.currency if currency.nil?
    end
  end

  def wholesale_line_item
    if self.order.is_wholesale?
      self.price = self.variant.send(:wholesale_price)
    else
      self.price = self.variant.send(:price)
    end
  end

end
