require 'rails_helper'

RSpec.describe "When i visit the homepage" do
  it "has a select field named Fire Nation" do
    visit '/'

    page.has_selector?('.select-field')
  end

  it "takes me to the search page", :vcr do
    json_response = File.read('spec/fixtures/response.json')
    stub_request(:get, "https://last-airbender-api.herokuapp.com/api/v1/characters").
           with(
             headers: {
         	  'Accept'=>'*/*',
         	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         	  'Authorization'=> "token #{ENV['GITHUB_API_TOKEN_R']}",
         	  'User-Agent'=>'Faraday v1.0.1'
             }).
           to_return(status: 200, body: json_response, headers: {})
    visit '/'

    click_on "Search For Members"

    expect(current_path).to eq('/search')
  end
  it "shows total number of people", :vcr do
    json_response = File.read('spec/fixtures/response.json')
    stub_request(:get, "https://last-airbender-api.herokuapp.com/api/v1/characters").
           with(
             headers: {
         	  'Accept'=>'*/*',
         	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         	  'Authorization'=> "token #{ENV['GITHUB_API_TOKEN_R']}",
         	  'User-Agent'=>'Faraday v1.0.1'
             }).
           to_return(status: 200, body: json_response, headers: {})
    visit '/'

    click_on "Search For Members"

    expect(page).to have_content(20)
  end
  it "lists member information", :vcr do
    json_response = File.read('spec/fixtures/response.json')
    stub_request(:get, "https://last-airbender-api.herokuapp.com/api/v1/characters").
           with(
             headers: {
         	  'Accept'=>'*/*',
         	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         	  'Authorization'=> "token #{ENV['GITHUB_API_TOKEN_R']}",
         	  'User-Agent'=>'Faraday v1.0.1'
             }).
           to_return(status: 200, body: json_response, headers: {})
    visit '/'

    click_on "Search For Members"
    within('#Afiko-Fire') do
      expect(page).to have_content("Member Allies: Fire Nation")
    end
    within('#Afiko-Aang') do
      expect(page).to have_content("Member Enemies: Aang")
    end
  end
end
