require 'spec_helper'

describe KISSmetrics::Property, '.find' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves a single property from the API' do
    VCR.use_cassette(:find_property) do
      response = KISSmetrics::Property.find(id)

      expect(response['meta']['status']).to eq 404
    end
  end
end

describe KISSmetrics::Property, '.all' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves all properties a user has access to' do
    VCR.use_cassette(:all_properties) do
      response = KISSmetrics::Property.all

      expect(response['meta']['status']).to eq 200
    end
  end
end
