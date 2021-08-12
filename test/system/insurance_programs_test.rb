require "application_system_test_case"

class InsuranceProgramsTest < ApplicationSystemTestCase
  setup do
    Rails.application.load_seed
    @insurance_program = InsuranceProgram.last
  end

  test "show page" do
    visit insurance_program_path(@insurance_program)
    assert_selector "h2", text: @insurance_program.name
  end
end
