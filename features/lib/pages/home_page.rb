class HomePage < SitePrism::Page

  include CapybaraHelper
  include Capybara::DSL
  include RSpec::Matchers

  element :travel_btn, '.c24-nav-travel'
  element :airport, '#c24-travel-airport-element'
  element :search_button, '#c24-travel-search-button-element'
  element :only_hotel, '.c24-travel-traveltype-hotelonly'
  element :destination, '.destinationSuggestionQueryInput__input'
  element :start_date, '#airBnbDateRangePicker_startDate_standard'


  def search_something search_txt

    only_hotel.click
    destination.set search_txt
    # Click on the auto fill element
    find(:css, '#react-autowhatever-1--item-1').click

    find(:css, '.searchFormContainer__form').click
    # Click on the search form
    find(:xpath, '//*[@id="searchFormContainer"]/section/form/div[2]/div/div[1]/div[2]/div/div[2]/div/div/button/span').click

  end

  def verify_hotel
    hotel_list = find(:css, '.hotelResultsList__listContents')
    expect(hotel_list.visible?).to be_truthy
    hotel_result = find(:css, '.hotelResultContainer')
    expect(hotel_result.visible?).to be_truthy
  end

end
