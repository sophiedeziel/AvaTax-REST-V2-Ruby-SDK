require File.expand_path('../../../spec_helper', __FILE__)

describe AvaTax::Client do
  let(:client) { AvaTax::Client.new() }
  let(:model) do
    {
      type: "SalesOrder",
      companyCode: "DEFAULT",
      date: "2016-11-02T00:00:00-07:00",
      customerCode: "ABC",
      addresses: {
        SingleLocation: {
          line1: "123 Main Street",
          city: "Irvine",
          region: "CA",
          country: "US",
          postalCode: "92615"
        }
      },
      lines: [
        {
          number: "1",
          quantity: 1,
          amount: 100,
          itemCode: "WIDGET001",
        }
      ]
    }
  end

  describe ".create_transaction" do
    before do
      stub_post("/api/v2/transactions/create").
        to_return(:body => fixture("transaction.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    subject { client.create_transaction(model) }

    it "should get the correct resource" do
      subject
      expect(a_post("/api/v2/transactions/create")).to have_been_made
    end

    it "should return the transactions details" do
      expect(subject).to be_a Object
      expect(subject['totalTax']).to equal 9.88
      expect(subject['totalTaxCalculated']).to equal 9.88
    end
  end
end
