class ImportationsController < ApplicationController

  def index
    @importation  = Importation.new
    @importations = Importation.includes(:sales)
  end

  def create
    @importation = Importation.new(importation_params)

    if @importation.save
      ImportSalesService.new(@importation).call
    end

    redirect_to importations_path
  end

  def show
    @importation = Importation.find params[:id]
  end

  private

    def importation_params
      params.require(:importation).permit(:file)
    end

end
