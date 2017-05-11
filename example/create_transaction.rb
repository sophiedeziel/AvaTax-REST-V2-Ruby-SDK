require 'yaml'
require File.expand_path('../../lib/avatax', __FILE__)

credentials = YAML.load_file(File.expand_path('../credentials.yaml', __FILE__))

AvaTax.configure do |config|
  config.endpoint = credentials['endpoint']
  config.username = credentials['username']
  config.password = credentials['password']
end

@client = AvaTax::Client.new()

model = {
  "type": "SalesOrder",
  "companyCode": "DEFAULT",
  "date": "2016-11-02T00:00:00-07:00",
  "customerCode": "ABC",
  "addresses": {
    "SingleLocation": {
      "line1": "123 Main Street",
      "city": "Irvine",
      "region": "CA",
      "country": "US",
      "postalCode": "92615"
    }
  },
  "lines": [
    {
      "number": "1",
      "quantity": 1,
      "amount": 100,
      "itemCode": "WIDGET001",
    }
  ]
}

transaction = @client.create_transaction(model)

puts transaction.to_json

