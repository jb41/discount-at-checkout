class Rule
  class NotImplementedException < Exception; end

  def initialize(discount, unit, item_code)
    @discount, @unit, @item_code = discount, unit, item_code
  end

  def applies?(items)
    items_rule_applies = items_to_which_rule_applies(items)
    rule_logic(items_rule_applies)
  end

  def apply!(items)
    items_to_which_rule_applies(items).map do |item|
      perform_rule!(item)
    end
  end

  protected

    def rule_logic(items)
      raise NotImplementedException
    end

    def perform_rule!(item)
      change_item_price(item)
    end


    def percent_discount(price)
      percent = 1.0 - (@discount.to_f / 100.0)
      price * percent
    end

    def price_discount
      @discount
    end

    def change_item_price(item)
      if @unit == '%'
        item.price = percent_discount(item.price)
      elsif @unit == '$'
        item.price = price_discount
      else
        raise NotImplementedException
      end
    end

    def items_to_which_rule_applies(items)
      return items if @item_code == nil
      return items.select { |item| item.code == @item_code }
    end

end
