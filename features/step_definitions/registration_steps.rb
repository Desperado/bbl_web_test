When(/^I select new customer sign-up/) do
  @check24.registration_page.go_to_registration
end

When(/^I select existing customer sign-in/) do
  @check24.registration_page.go_to_sign_in
end

When(/^I enter email as "(.*?)" and password as "(.*?)"$/) do |email , pass|
  @check24.registration_page.email.set email
  @check24.registration_page.password.set pass
end

When(/^I enter random email and password as "(.*?)"$/) do |pass|
  @check24.registration_page.enter_fake_email
  @check24.registration_page.password.set pass
end

When(/^I validate email entered as "(.*?)" and password as "(.*?)"/) do |email, pass|
  @check24.registration_page.verify_email_password email, pass
end

When(/^I enter password as "(.*?)" again$/) do |pass|
  @check24.registration_page.password_repeat.set pass
end

When(/^I confirm registration$/) do
  @check24.registration_page.confirm_registration
end

When(/^I confirm sign-in$/) do
  @check24.registration_page.register_confirm.click
end

When(/^I verify that this email account "(.*?)" is used$/) do |email|
  @check24.registration_page.account_used email
end

When(/^I close the welcomebonus pop-up$/) do
  @check24.user_page.close_welcomebonus_popup
end

Then(/^I am redirected to user account page$/) do
  @check24.user_page.verify_redirect_to_user_page
end

Then(/^I validate password strength message "(.*?)"$/) do |txt|
  @check24.registration_page.validate_pass_strength txt
end

Then(/^I got an email error message "(.*?)"$/) do |txt|
  @check24.registration_page.verify_email_issue txt
end

Then(/^I got a password error message "(.*?)"$/) do |txt|
  @check24.registration_page.verify_pass_issue txt
end

Then(/^I got a password confirm error message "(.*?)"$/) do |txt|
  @check24.registration_page.verify_pass_confirm_issue txt
end

Then(/^I verify URL contains "(.*?)"$/) do |txt|
  @check24.registration_page.url_contains txt
end