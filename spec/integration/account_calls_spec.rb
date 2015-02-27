require 'spec_helper'
require 'pry'

describe KISSmetrics::Account, '.find' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves a single address from the API' do
    VCR.use_cassette(:find_account) do
      response = KISSmetrics::Account.find(id)

      expect(response['meta']['status']).to eq 200
    end
  end
end
