require 'spec_helper'

describe KISSmetrics::Metric, '.query' do
  it 'defaults to the query hash' do
    expect(KISSmetrics::Metric.query).to eq(
      { path: '/core/metrics', params: {} }
    )
  end
end

describe KISSmetrics::Metric, '.find' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }
  let(:connection) { double(:faraday_connection).as_null_object }

  it 'adds a single specific metric to the path' do
    KISSmetrics::Metric.find(id)

    expect(KISSmetrics::Metric.query).to eq(
      { path: "/core/metrics/#{id}", params: {} }
    )
  end

  it 'makes a request for the given metric' do
    KISSmetrics.stub(:connection).and_return(connection)

    response = KISSmetrics::Metric.find(id)

    response.to_hash # kick the query

    expect(connection).to have_received(:get).with(
      "/core/metrics/#{id}",
      {},
      {
        accept: 'application/json',
        content_type: 'application/json; charset=UTF-8',
        authorization: 'Bearer ' + ENV['KISSMETRICS_API_KEY']
      }
    )
  end
end

describe KISSmetrics::Metric, '.all' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }
  let(:connection) { double(:faraday_connection).as_null_object }

  it 'does not augment the default query' do
    KISSmetrics::Metric.all

    expect(KISSmetrics::Metric.query).to eq(
      { path: '/core/metrics', params: {} }
    )
  end

  it 'makes a request for all metrics the user has access to' do
    KISSmetrics.stub(:connection).and_return(connection)

    response = KISSmetrics::Metric.all

    response.to_hash # kick the query

    expect(connection).to have_received(:get).with(
      '/core/metrics',
      {},
      {
        accept: 'application/json',
        content_type: 'application/json; charset=UTF-8',
        authorization: 'Bearer ' + ENV['KISSMETRICS_API_KEY']
      }
    )
  end
end

describe KISSmetrics::Metric, 'inspect' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }

  before :each do
    KISSmetrics.stub(:get)
  end

  it 'resets the query' do
    KISSmetrics::Metric.find(id).inspect

    expect(KISSmetrics::Metric.query).to eq({
      path: '/core/metrics',
      params: {}
    })
  end
end
