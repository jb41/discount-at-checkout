require 'spec_helper'

describe Rule do

  describe "#applies?" do
    it "should raise an exception" do
      items = [
        Product.new('001', 'Travel Card Holder', 9.25),
      ]
      rule = Rule.new(10, '$', nil)

      expect { rule.applies?(items) }.to raise_error(Rule::NotImplementedException)
    end
  end

  describe "#apply!" do
    it "should raise an exception" do
      items = [
        Product.new('001', 'Travel Card Holder', 9.25),
      ]
      rule = Rule.new(10, nil, nil)

      expect { rule.apply!(items) }.to raise_error(Rule::NotImplementedException)
    end
  end

end
