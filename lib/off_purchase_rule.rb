# Rule which changes prices of all items by 10% if
# total price in shopping cart is £60 or more
# OffPurchaseRule.new(10, '%', nil)
# It will change price of all items by 10%
class OffPurchaseRule < Rule

  protected

    def rule_logic(items)
      items.map(&:price).inject(:+) > 60
    end

end
