require 'spec_helper'

describe KISSmetrics::Property, '.query' do
  it 'defaults to the query hash' do
    expect(KISSmetrics::Property.query).to eq(
      { path: '/core/properties', params: {} }
    )
  end
end

describe KISSmetrics::Property, '.find' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }
  let(:connection) { double(:faraday_connection).as_null_object }

  it 'adds a single specific property to the path' do
    KISSmetrics::Property.find(id)

    expect(KISSmetrics::Property.query).to eq(
      { path: "/core/properties/#{id}", params: {} }
    )
  end

  it 'makes a request for the given property' do
    KISSmetrics.stub(:connection).and_return(connection)

    response = KISSmetrics::Property.find(id)

    response.to_hash # kick the query

    expect(connection).to have_received(:get).with(
      "/core/properties/#{id}",
      {},
      {
        accept: 'application/json',
        content_type: 'application/json; charset=UTF-8',
        authorization: 'Bearer ' + ENV['KISSMETRICS_API_KEY']
      }
    )
  end
end

describe KISSmetrics::Property, '.all' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }
  let(:connection) { double(:faraday_connection).as_null_object }

  it 'does not augment the default query' do
    KISSmetrics::Property.all

    expect(KISSmetrics::Property.query).to eq(
      { path: '/core/properties', params: {} }
    )
  end

  it 'makes a request for all properties the user has access to' do
    KISSmetrics.stub(:connection).and_return(connection)

    response = KISSmetrics::Property.all

    response.to_hash # kick the query

    expect(connection).to have_received(:get).with(
      '/core/properties',
      {},
      {
        accept: 'application/json',
        content_type: 'application/json; charset=UTF-8',
        authorization: 'Bearer ' + ENV['KISSMETRICS_API_KEY']
      }
    )
  end
end

describe KISSmetrics::Property, 'inspect' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }

  before :each do
    KISSmetrics.stub(:get)
  end

  it 'resets the query' do
    KISSmetrics::Property.find(id).inspect

    expect(KISSmetrics::Property.query).to eq({
      path: '/core/properties',
      params: {}
    })
  end
end
