class App::HomeController < ApplicationController
  before_action :force_json, only: :search

  def index
    if index_params['insurance_category_id']
      @insurance_programs = InsuranceProgram.where(insurance_category_id: index_params['insurance_category_id']).limit(6)
    else
      @insurance_programs = InsuranceProgram.all.limit(6)
    end
  end

  def search_category
    @categories = InsuranceCategory.ransack(name_cont: params[:q]).result(distinct: true).limit(5)
    render json: @categories
  end

  private

    def force_json
      request.format = :json
    end

    def index_params
      params.permit(:insurance_category_id)
    end
end
