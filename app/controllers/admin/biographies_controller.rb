class Admin::BiographiesController < ApplicationController

  def edit
    @biography = Biography.find(params[:id])
  end

  def update
    @biography = Biography.find(params[:id])
    @biography.update_attributes(biography_params)
  end

  private
    def biography_params
      params.require(:biography).permit(:content)
    end
end