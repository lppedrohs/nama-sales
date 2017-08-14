class ImportationsController < ApplicationController

  def index
    @importation  = Importation.new
    @importations = Importation.all
  end

  def create
    @importation = FileParserService.new(importation_params).call

    @importation.save

    redirect_to importations_path
  end

  private

    def importation_params
      params.require(:importation).permit(:file)
    end

end
