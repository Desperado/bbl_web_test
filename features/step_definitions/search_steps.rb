When(/^I open travel section/) do
  @check24.home_page.travel_btn.click
end

When(/^I search for hotels with search word "(.*?)"/) do | search_txt |
  @check24.home_page.search_something search_txt
end

When(/^I verify that search has returned some results/) do
  @check24.home_page.verify_hotel
end