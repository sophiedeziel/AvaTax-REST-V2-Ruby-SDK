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
        post("/api/v2/transactions/create", model)
      end
    end
  end
end

