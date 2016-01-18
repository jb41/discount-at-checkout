# Rule which changes prices of an item if two or more
# are in the shopping cart
# ex. MoreThanRule.new(8.5, '$', '001')
# It will change price of item '001' to £8.5
class TwoOrMoreRule < Rule

  protected

    def rule_logic(items)
      items.size >= 2
    end

end
