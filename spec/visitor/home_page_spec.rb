require 'rails_helper'

RSpec.describe "When i visit the homepage" do
  it "has a select field named Fire Nation" do
    visit '/'

    page.has_selector?('.select-field')
  end

  it "takes me to the search page" do
    visit '/'

    click_on "Search For Members"

    expect(current_path).to eq('/search')

  end

end
