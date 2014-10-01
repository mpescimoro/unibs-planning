class DegreesController < ApplicationController
  before_action :set_degree, only: [:edit, :update]

  def index
    @degrees = Degree.all
  end

  def edit
  end

  def update
    @degree.update(degree_params)
    redirect_to degrees_path
  end

  private
  def degree_params
    params.require(:degree).permit(:human_name, :short_name)
  end

  def set_degree
    @degree = Degree.find(params[:id])
  end
end
