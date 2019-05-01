class RegistrationPage < SitePrism::Page

  include CapybaraHelper
  include Capybara::DSL
  include RSpec::Matchers

  element :menu_my_account, '.c24-customer'
  element :email, '#email'
  element :password, '#password'
  element :password_repeat, '#passwordrepetition'
  element :register_now, '#register > div.c24-kb-form-button-row > div.right > button'
  element :dialog_box, '.dialog-box-content'
  element :register_confirm, '#c24-kb-register-btn'
  element :password_complexity, '#indicator-text'
  element :sign_in, '#c24-meinkonto-anmelden'

  def go_to_registration
    menu_my_account.hover
    new_registration = find(:xpath, '//*[@id="c24-meinkonto"]/div/div[2]/a')
    new_registration.click
  end

  def go_to_sign_in
    menu_my_account.hover
    sign_in.click
  end

  def enter_fake_email
    fake_email = Faker::Internet.email
    email.set fake_email
  end

  def verify_email_password e, p
    expect(email.value).to eq(e)
    expect(password.value).to eq(p)
  end

  def confirm_registration
    register_now.click
  end

  def account_used email
    wait_until_dialog_box_visible(wait:10)
    expect(dialog_box.text).to include("Es existiert ein Konto mit der E-Mail-Adresse „#{email}”.")
  end

  def validate_pass_strength txt
    expect(password_complexity.text).to eq(txt)
  end

  def verify_email_issue txt
    email_error_msg = find(:xpath, '//*[@id="register"]/div[2]/div[3]/div')
    expect(email_error_msg.text).to eq(txt)
  end

  def verify_pass_issue txt
    pass_error_msg = find(:xpath, '//*[@id="register"]/div[3]/div[3]/div[1]')
    expect(pass_error_msg.text).to eq(txt)
  end

  def verify_pass_confirm_issue txt
    pass_error_msg = find(:xpath, '//*[@id="register"]/div[4]/div[2]/div[1]')
    expect(pass_error_msg.text).to eq(txt)
  end

  def url_contains txt
    expect(current_url).to include(txt)
  end

end