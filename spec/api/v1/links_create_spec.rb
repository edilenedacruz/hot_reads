require 'rails_helper'

RSpec.describe "Links API" do
  it "can create a new link" do

    link_params = { url: "http://www.turing.io" }

    post '/api/v1/links', params: {link: link_params}

    last_url = Link.last

    expect(response).to be_success
    expect(last_url.url).to eq("http://www.turing.io")
  end

  it "can display all links" do
    link_1 = Link.create(url: "http://www.edilene.io", count: 7)
    link_2 = Link.create(url: "http://www.ullr.com", count: 3)

    get '/api/v1/links'

    hot_links = JSON.parse(response.body)

    expect(response).to be_success
    expect(hot_links.count).to eq(2)
  end

  it "display links in order of updated at" do
    link_1 = Link.create(url: "http://www.edilene.io", count: 7, updated_at: 5.hours.ago)
    link_2 = Link.create(url: "http://www.ullr.com", count: 3)

    get '/api/v1/links'

    top_link = JSON.parse(response.body).first
    hot_links = JSON.parse(response.body).last

    expect(response).to be_success
    expect(top_link["url"]).to eq(link_1.url)
  end
end
