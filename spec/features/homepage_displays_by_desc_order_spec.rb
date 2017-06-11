require 'rails_helper'

RSpec.feature "Homepage" do
  it "display links by highest count" do
    link_1 = Link.create(url: "http://www.turing.io", count: 10)
    link_2 = Link.create(url: "http://www.ullr.com", count: 3)
    link_3 = Link.create(url: "http://www.edilene.io", count: 7)
    link_4 = Link.create(url: "http://www.google.com", count: 5)

    visit '/'

    within('tr#1') do
      expect(page).to have_content(link_1.url)
    end

    within('tr#2') do
      expect(page).to have_content(link_3.url)
    end

    within('tr#3') do
      expect(page).to have_content(link_4.url)
    end

    within('tr#4') do
      expect(page).to have_content(link_2.url)
    end
  end

  it "displays only links that have been updates within the past 24 hrs" do
    link_1 = Link.create(url: "http://www.turing.io", count: 10)
    link_2 = Link.create(url: "http://www.ullr.com", count: 3)
    link_3 = Link.create(url: "http://www.edilene.io", count: 7)
    link_4 = Link.create(url: "http://www.google.com", count: 5, updated_at: 3.days.ago)

    visit '/'

    expect(page).to_not have_content("http://www.google.com")
  end
end
