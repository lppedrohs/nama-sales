class ImportationsController < ApplicationController

  def index
    @importation  = Importation.new
    @importations = Importation.includes(:sales).order(created_at: :desc)
  end

  def create
    @importation = Importation.new(importation_params)

    if @importation.save
      ImportSalesService.new(@importation).call
    end

    redirect_to importations_path
  end

  def show
    @importation = Importation.find(params[:id])
    @sales       = Sale.includes(:buyer, :provider).where(importation: @importation)
  end

  private

    def importation_params
      params.require(:importation).permit(:file)
    end

end
