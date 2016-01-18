require 'spec_helper'

describe Checkout do
  before(:each) do
    rules = [
      TwoOrMoreRule.new(8.5, '$', '001'),
      OffPurchaseRule.new(10, '%', nil)
    ]

    @checkout = Checkout.new(rules)
  end

  describe "#scan" do
    it "saves all items correctly" do
      items = [
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('002', 'Personalised cufflinks', 45.0),
        Product.new('003', 'Kids T-shirt', 19.95)
      ]
      items.each { |item| @checkout.scan(item) }

      # I'm assuming that Checkout doesn't need to have .items method to
      # access items
      expect(@checkout.instance_variable_get("@items")).to eq(items)
    end
  end

  # Test cases for example data
  describe "#total" do
    it "have proper price for 1st use case" do
      items = [
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('002', 'Personalised cufflinks', 45.0),
        Product.new('003', 'Kids T-shirt', 19.95)
      ]
      items.each { |item| @checkout.scan(item) }

      expect(@checkout.total).to eq(66.78)
    end

    it "have proper price for 2nd use case" do
      items = [
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('003', 'Kids T-shirt', 19.95),
        Product.new('001', 'Travel Card Holder', 9.25),
      ]
      items.each { |item| @checkout.scan(item) }

      expect(@checkout.total).to eq(36.95)
    end

    it "have proper price for 3rd use case" do
      items = [
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('002', 'Personalised cufflinks', 45.0),
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('003', 'Kids T-shirt', 19.95)
      ]
      items.each { |item| @checkout.scan(item) }

      expect(@checkout.total).to eq(73.76)
    end

  end

end
