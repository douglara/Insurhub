require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  setup do
    Rails.application.load_seed
    @insurance_program = InsuranceProgram.first
  end

  test "index page" do
    visit app_home_index_path()
    assert_selector "a", text: @insurance_program.name
  end

  test "search bar" do
    visit app_home_index_path()
    fill_in "search-bar-input", with: @insurance_program.insurance_category.name
    assert_selector "div", text: @insurance_program.insurance_category.name

    click_link @insurance_program.insurance_category.name, match: :first
    assert_selector('.article-style-c', count: InsuranceProgram.where(insurance_category: @insurance_program.insurance_category).count)
  end

  test "search bar not found" do
    visit app_home_index_path()
    fill_in "search-bar-input", with: 'Rental'
    assert_selector "div", text: 'Rental'

    click_link 'Rental', match: :first
    assert_selector('.article-style-c', count: 0)
  end
end
