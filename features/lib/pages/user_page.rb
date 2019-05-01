class UserPage < SitePrism::Page

  include CapybaraHelper
  include Capybara::DSL
  include RSpec::Matchers

  element :welcome_bonus_close, '.button-cancel'
  element :pop_up_checkbox, '#c24-dialog-points-modal > div > div > div.c24-points-register > label'
  element :dialog_box, '.c24-dialog-box'
  element :c24_user_container , '.c24-kb-ua-container'

  def verify_redirect_to_user_page
    wait_until_c24_user_container_visible(wait:10)
  end

  def close_welcomebonus_popup
    wait_until_dialog_box_visible(wait:10)
    welcome_bonus_close.click
  end

end