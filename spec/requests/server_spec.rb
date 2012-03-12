require 'spec_helper'

feature 'Venue API' do

  context "GET#index" do
    it "works" do
      visit '/'
      page.should have_content("hello, world")
    end
  end

  context "GET#venues" do
    it "it works" do
      visit '/venues'
      json.should == []
    end
  end
end
