require 'spec_helper'

describe KISSmetrics::Metric, '.find' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves a single metric from the API' do
    VCR.use_cassette(:find_metric) do
      response = KISSmetrics::Metric.find(id)

      expect(response['meta']['status']).to eq 200
    end
  end
end

describe KISSmetrics::Metric, '.all' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves all metrics a user has access to' do
    VCR.use_cassette(:all_metrics) do
      response = KISSmetrics::Metric.all

      expect(response['meta']['status']).to eq 200
    end
  end
end
