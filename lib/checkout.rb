class Checkout

  # Initialize Checkout with rules
  # Rule can be instance of
  #   - TwoOrMoreRule
  #   - OffPurchaseRule
  def initialize(rules)
    @rules = rules
    @items = []
  end

  # Add item
  def scan(item)
    @items << item
  end

  # Get total price after applying all discount rules
  # float, rounded to two places after decimal point
  def total
    @rules.each do |rule|
      rule.apply!(@items) if rule.applies?(@items)
    end

    @items.map(&:price).inject(:+).round(2)
  end

end
