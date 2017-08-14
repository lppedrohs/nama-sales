class ProvidersController < ApplicationController
  before_action :find_provider, only: [:show, :edit, :update, :destroy]

  def index
    @providers = Provider.all
  end

  def show
  end

  def new
    @provider = Provider.new
  end

  def edit
  end

  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      redirect_to @provider, notice: 'Provider was successfully created.'
    else
      render :new
    end
  end

  def update
    if @provider.update(provider_params)
      redirect_to @provider, notice: 'Provider was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @provider.destroy
    redirect_to providers_url, notice: 'Provider was successfully destroyed.'
  end

  private

    def find_provider
      @provider = Provider.find params[:id]
    end

    def provider_params
      params.require(:provider).permit(:name)
    end
end
