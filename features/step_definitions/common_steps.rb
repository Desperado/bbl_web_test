Given(/^I navigate to check24 landing page$/) do
  @check24 = Check24.new
  visit "#{EnvConfig.get :app_url}"
end
