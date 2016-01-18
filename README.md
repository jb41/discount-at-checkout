## Interface
The interface to checkout looks like this:
```ruby
co = Checkout.new(promotional_rules)
co.scan(item)
co.scan(item)
price = co.total
```

## Specs
```sh
rspec
```
