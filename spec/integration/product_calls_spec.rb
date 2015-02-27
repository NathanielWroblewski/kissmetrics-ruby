require 'spec_helper'

describe KISSmetrics::Product, '.find' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves a single product from the API' do
    VCR.use_cassette(:find_product) do
      response = KISSmetrics::Product.find(id)

      expect(response['meta']['status']).to eq 404
    end
  end
end

describe KISSmetrics::Product, '.all' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves all products a user has access to' do
    VCR.use_cassette(:all_products) do
      response = KISSmetrics::Product.all

      expect(response['meta']['status']).to eq 404
    end
  end
end

describe KISSmetrics::Product, '.events' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves all events associated with an product' do
    VCR.use_cassette(:product_events) do
      response = KISSmetrics::Product.find(id).events

      expect(response['meta']['status']).to eq 404
    end
  end
end

describe KISSmetrics::Product, '.metrics' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves all metrics associated with an product' do
    VCR.use_cassette(:product_metrics) do
      response = KISSmetrics::Product.find(id).metrics

      expect(response['meta']['status']).to eq 404
    end
  end
end

describe KISSmetrics::Product, '.properties' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves all properties associated with an product' do
    VCR.use_cassette(:product_properties) do
      response = KISSmetrics::Product.find(id).properties

      expect(response['meta']['status']).to eq 404
    end
  end
end

describe KISSmetrics::Product, '.reports' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves all reports associated with an product' do
    VCR.use_cassette(:product_reports) do
      response = KISSmetrics::Product.find(id).reports

      expect(response['meta']['status']).to eq 200
    end
  end
end
