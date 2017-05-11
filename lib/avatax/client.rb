module AvaTax
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include AvaTax::Client::Accounts
    include AvaTax::Client::Transactions
  end
end
