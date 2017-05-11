module AvaTax
  class Client
    module Transactions
      # Create a transaction
      #
      # @param model [Hash] the transaction object you wish to create
      #
      # @return [Hashie::Mash] TransactionModel
      # @example Creates a transaction
      #   AvaTax.create_transaction({ type: "SalesOrder", customerCode: "ABC", ... })
      def create_transaction(model)
        post('/api/v2/transactions/create', model)
      end

      # Retrieve a transaction
      #
      # @param options
      #
      # @return [Hashie::Mash] The requested transaction.
      # @example Returns a transaction
      #   AvaTax.get_transaction()
      def get_transaction(id, options={})
        get("/api/v2/transactions/#{id}", options || {})
      end
    end
  end
end