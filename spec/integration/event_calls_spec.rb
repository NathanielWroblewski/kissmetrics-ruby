require 'spec_helper'

describe KISSmetrics::Event, '.find' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves a single event from the API' do
    VCR.use_cassette(:find_event) do
      response = KISSmetrics::Event.find(id)

      expect(response['meta']['status']).to eq 404
    end
  end
end

describe KISSmetrics::Event, '.all' do
  let(:id) { '8d637290-a04f-0132-83a0-22000ab4dcd7' }

  it 'retrieves all events a user has access to' do
    VCR.use_cassette(:all_events) do
      response = KISSmetrics::Event.all

      expect(response['meta']['status']).to eq 200
    end
  end
end
