require 'spec_helper'

describe TwoOrMoreRule do

  describe "#applies?" do
    it "shouldn't apply" do
      items = [
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('002', 'Personalised cufflinks', 45.0)
      ]

      rule = TwoOrMoreRule.new(8.5, '$', '001')

      expect(rule.applies?(items)).to eq(false)
    end

    it "should apply" do
      items = [
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('002', 'Personalised cufflinks', 45.0)
      ]

      rule = TwoOrMoreRule.new(8.5, '$', '001')

      expect(rule.applies?(items)).to eq(true)
    end
  end

  describe "#apply!" do
    it "should change items prices" do
      items = [
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('002', 'Personalised cufflinks', 45.0)
      ]
      changed_prices = [8.5, 8.5, 45.0]

      rule = TwoOrMoreRule.new(8.5, '$', '001')
      rule.apply!(items)

      items.each_with_index do |item, index|
        expect(item.price).to eq(changed_prices[index])
      end
    end
  end

end
