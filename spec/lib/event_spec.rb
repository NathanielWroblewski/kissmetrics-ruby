require 'spec_helper'

describe KISSmetrics::Event, '.query' do
  it 'defaults to the query hash' do
    expect(KISSmetrics::Event.query).to eq(
      { path: '/core/events', params: {} }
    )
  end
end

describe KISSmetrics::Event, '.find' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }
  let(:connection) { double(:faraday_connection).as_null_object }

  it 'adds a single specific account to the path' do
    KISSmetrics::Event.find(id)

    expect(KISSmetrics::Event.query).to eq(
      { path: "/core/events/#{id}", params: {} }
    )
  end

  it 'makes a request for the given account' do
    KISSmetrics.stub(:connection).and_return(connection)

    response = KISSmetrics::Event.find(id)

    response.to_hash # kick the query

    expect(connection).to have_received(:get).with(
      "/core/events/#{id}",
      {},
      {
        accept: 'application/json',
        content_type: 'application/json; charset=UTF-8',
        authorization: 'Bearer ' + ENV['KISSMETRICS_API_KEY']
      }
    )
  end
end

describe KISSmetrics::Event, '.all' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }
  let(:connection) { double(:faraday_connection).as_null_object }

  it 'does not augment the default query' do
    KISSmetrics::Event.all

    expect(KISSmetrics::Event.query).to eq(
      { path: '/core/events', params: {} }
    )
  end

  it 'makes a request for all events the user has access to' do
    KISSmetrics.stub(:connection).and_return(connection)

    response = KISSmetrics::Event.all

    response.to_hash # kick the query

    expect(connection).to have_received(:get).with(
      '/core/events',
      {},
      {
        accept: 'application/json',
        content_type: 'application/json; charset=UTF-8',
        authorization: 'Bearer ' + ENV['KISSMETRICS_API_KEY']
      }
    )
  end
end

describe KISSmetrics::Event, 'inspect' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }

  before :each do
    KISSmetrics.stub(:get)
  end

  it 'resets the query' do
    KISSmetrics::Event.find(id).inspect

    expect(KISSmetrics::Event.query).to eq({
      path: '/core/events',
      params: {}
    })
  end
end
