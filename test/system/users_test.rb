require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  test "create user with success" do
    visit new_user_registration_path()
    fill_in "name", with: "User Name"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    find('input[name="commit"]').click
    assert_selector "div", text: "Hi, User Name"
  end

  test "create user with invalid password" do
    visit new_user_registration_path()
    fill_in "name", with: "User Name"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password_error"
    find('input[name="commit"]').click
    assert_selector "li", text: "Doesn't match password"
  end

  test "sign in success" do
    User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password', full_name: 'User Name')
    visit new_user_session_path()
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "password"
    find('input[name="commit"]').click
    assert_selector "div", text: "Hi, User Name"
  end

  test "sign in with error" do
    visit new_user_session_path()
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "password"
    find('input[name="commit"]').click
    assert_selector "h4", text: "Login"
  end
end
