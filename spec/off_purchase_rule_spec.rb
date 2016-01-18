require 'spec_helper'

describe OffPurchaseRule do

  describe "#applies?" do
    it "should apply" do
      items = [
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('003', 'Kids T-shirt', 19.95)
      ]

      rule = OffPurchaseRule.new(10, '%', nil)

      expect(rule.applies?(items)).to eq(false)
    end

    it "should apply" do
      items = [
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('002', 'Personalised cufflinks', 45.0),
        Product.new('003', 'Kids T-shirt', 19.95)
      ]

      rule = OffPurchaseRule.new(10, '%', nil)

      expect(rule.applies?(items)).to eq(true)
    end
  end

  describe "#apply!" do
    it "should change items prices" do
      items = [
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('002', 'Personalised cufflinks', 45.0),
        Product.new('003', 'Kids T-shirt', 19.95)
      ]
      changed_prices = [9.25, 45.0, 19.95].map {|x| (x * 0.9).round(2) }

      rule = OffPurchaseRule.new(10, '%', nil)
      rule.apply!(items)

      items.each_with_index do |item, index|
        expect(item.price.round(2)).to eq(changed_prices[index])
      end
    end
  end

end
