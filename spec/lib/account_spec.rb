require 'spec_helper'

describe KISSmetrics::Account, '.query' do
  it 'defaults to the query hash' do
    expect(KISSmetrics::Account.query).to eq(
      { path: '/core/accounts/', params: {} }
    )
  end
end

describe KISSmetrics::Account, '.find' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }
  let(:connection) { double(:faraday_connection).as_null_object }

  after :each do
    KISSmetrics::Account.inspect # clear the query for other specs
  end

  it 'adds a single specific account to the path' do
    KISSmetrics::Account.find(id)

    expect(KISSmetrics::Account.query).to eq(
      { path: "/core/accounts/#{id}", params: {} }
    )
  end

  it 'makes a request for the given account' do
    KISSmetrics.stub(:connection).and_return(connection)

    response = KISSmetrics::Account.find(id)

    response['data'] # kick the query

    expect(connection).to have_received(:get).with(
      "/core/accounts/#{id}",
      {},
      {
        accept: 'application/json',
        content_type: 'application/json; charset=UTF-8',
        authorization: 'Bearer ' + ENV['KISSMETRICS_API_KEY']
      }
    )
  end
end

describe KISSmetrics::Account, 'inspect' do
  let(:id) { '240cf230-0624-0132-b634-22000a9f1c0f' }

  before :each do
    KISSmetrics.stub(:get)
  end

  it 'resets the query' do
    KISSmetrics::Account.find(id).inspect

    expect(KISSmetrics::Account.query).to eq({
      path: '/core/accounts/',
      params: {}
    })
  end
end
