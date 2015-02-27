require 'spec_helper'

describe KISSmetrics::Account, '.find' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves a single account from the API' do
    VCR.use_cassette(:find_account) do
      response = KISSmetrics::Account.find(id)

      expect(response['meta']['status']).to eq 200
    end
  end
end

describe KISSmetrics::Account, '.all' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves all accounts a user has access to' do
    VCR.use_cassette(:all_accounts) do
      response = KISSmetrics::Account.all

      expect(response['meta']['status']).to eq 200
    end
  end
end

describe KISSmetrics::Account, '.products' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves all products associated with an account' do
    VCR.use_cassette(:account_products) do
      response = KISSmetrics::Account.find(id).products

      expect(response['meta']['status']).to eq 200
    end
  end
end

