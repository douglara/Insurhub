class InsuranceProgramsController < ApplicationController
  before_action :set_insurance_program, only: %i[ show edit update destroy ]

  # GET /insurance_programs/1 or /insurance_programs/1.json
  def show
    @category_phone_url = get_background_picture_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance_program
      @insurance_program = InsuranceProgram.find(params[:id])
    end

    def get_background_picture_url
      Unsplash::Photo.random(query: "#{@insurance_program.insurance_category.name}").urls.regular rescue '/imgs/insurance-background.jpeg'
    end
end
