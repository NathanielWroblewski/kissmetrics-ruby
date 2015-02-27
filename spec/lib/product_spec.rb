require 'spec_helper'

describe KISSmetrics::Product, '.query' do
  it 'defaults to the query hash' do
    expect(KISSmetrics::Product.query).to eq(
      { path: '/core/products', params: {} }
    )
  end
end

describe KISSmetrics::Product, '.find' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }
  let(:connection) { double(:faraday_connection).as_null_object }

  it 'adds a single specific product to the path' do
    KISSmetrics::Product.find(id)

    expect(KISSmetrics::Product.query).to eq(
      { path: "/core/products/#{id}", params: {} }
    )
  end

  it 'makes a request for the given product' do
    KISSmetrics.stub(:connection).and_return(connection)

    response = KISSmetrics::Product.find(id)

    response.to_hash # kick the query

    expect(connection).to have_received(:get).with(
      "/core/products/#{id}",
      {},
      {
        accept: 'application/json',
        content_type: 'application/json; charset=UTF-8',
        authorization: 'Bearer ' + ENV['KISSMETRICS_API_KEY']
      }
    )
  end
end

describe KISSmetrics::Product, '.all' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }
  let(:connection) { double(:faraday_connection).as_null_object }

  it 'does not augment the default query' do
    KISSmetrics::Product.all

    expect(KISSmetrics::Product.query).to eq(
      { path: '/core/products', params: {} }
    )
  end

  it 'makes a request for all products the user has access to' do
    KISSmetrics.stub(:connection).and_return(connection)

    response = KISSmetrics::Product.all

    response.to_hash # kick the query

    expect(connection).to have_received(:get).with(
      '/core/products',
      {},
      {
        accept: 'application/json',
        content_type: 'application/json; charset=UTF-8',
        authorization: 'Bearer ' + ENV['KISSMETRICS_API_KEY']
      }
    )
  end
end

describe KISSmetrics::Product, '.events' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }
  let(:connection) { double(:faraday_connection).as_null_object }

  it 'appends events to the query' do
    KISSmetrics::Product.find(id).events

    expect(KISSmetrics::Product.query).to eq(
      { path: "/core/products/#{id}/events", params: {} }
    )
  end

  it 'makes a request for all the events associated with a product' do
    KISSmetrics.stub(:connection).and_return(connection)

    response = KISSmetrics::Product.find(id).events

    response.to_hash # kick the query

    expect(connection).to have_received(:get).with(
      "/core/products/#{id}/events",
      {},
      {
        accept: 'application/json',
        content_type: 'application/json; charset=UTF-8',
        authorization: 'Bearer ' + ENV['KISSMETRICS_API_KEY']
      }
    )
  end
end

describe KISSmetrics::Product, '.metrics' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }
  let(:connection) { double(:faraday_connection).as_null_object }

  it 'appends metrics to the query' do
    KISSmetrics::Product.find(id).metrics

    expect(KISSmetrics::Product.query).to eq(
      { path: "/core/products/#{id}/metrics", params: {} }
    )
  end

  it 'makes a request for all the metrics associated with a product' do
    KISSmetrics.stub(:connection).and_return(connection)

    response = KISSmetrics::Product.find(id).metrics

    response.to_hash # kick the query

    expect(connection).to have_received(:get).with(
      "/core/products/#{id}/metrics",
      {},
      {
        accept: 'application/json',
        content_type: 'application/json; charset=UTF-8',
        authorization: 'Bearer ' + ENV['KISSMETRICS_API_KEY']
      }
    )
  end
end

describe KISSmetrics::Product, '.reports' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }
  let(:connection) { double(:faraday_connection).as_null_object }

  it 'appends reports to the query' do
    KISSmetrics::Product.find(id).reports

    expect(KISSmetrics::Product.query).to eq(
      { path: "/core/products/#{id}/reports", params: {} }
    )
  end

  it 'makes a request for all the reports associated with a product' do
    KISSmetrics.stub(:connection).and_return(connection)

    response = KISSmetrics::Product.find(id).reports

    response.to_hash # kick the query

    expect(connection).to have_received(:get).with(
      "/core/products/#{id}/reports",
      {},
      {
        accept: 'application/json',
        content_type: 'application/json; charset=UTF-8',
        authorization: 'Bearer ' + ENV['KISSMETRICS_API_KEY']
      }
    )
  end
end

describe KISSmetrics::Product, '.properties' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }
  let(:connection) { double(:faraday_connection).as_null_object }

  it 'appends properties to the query' do
    KISSmetrics::Product.find(id).properties

    expect(KISSmetrics::Product.query).to eq(
      { path: "/core/products/#{id}/properties", params: {} }
    )
  end

  it 'makes a request for all the properties associated with a product' do
    KISSmetrics.stub(:connection).and_return(connection)

    response = KISSmetrics::Product.find(id).properties

    response.to_hash # kick the query

    expect(connection).to have_received(:get).with(
      "/core/products/#{id}/properties",
      {},
      {
        accept: 'application/json',
        content_type: 'application/json; charset=UTF-8',
        authorization: 'Bearer ' + ENV['KISSMETRICS_API_KEY']
      }
    )
  end
end

describe KISSmetrics::Product, 'inspect' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }

  before :each do
    KISSmetrics.stub(:get)
  end

  it 'resets the query' do
    KISSmetrics::Product.find(id).inspect

    expect(KISSmetrics::Product.query).to eq({
      path: '/core/products',
      params: {}
    })
  end
end
