require "features_helper"

feature "User registration" do
  scenario "User is not yet registered" do
    when_they_register
    then_they_should_be_registered
  end

  scenario "User is already registered" do
    given_an_existing_user
    when_they_register
  end

  def when_they_register
    visit "/users/new"
    fill_in_and_submit_user_registration_form
  end

  def fill_in_and_submit_user_registration_form
    fill_in "Email", with: "alice@example.com"
    fill_in "Password", with: "password"
    click_button "Submit"
  end

  def then_they_should_be_registered
    UserRepository.user_with_email('alice@example.com')
  end

  def then_they_should_see_an_error
    expect(page).to match "Already registered"
  end

  def given_an_existing_user
    UserRepository.create(User.new(email: 'alice@example.com', password: 'password'))
  end
end
