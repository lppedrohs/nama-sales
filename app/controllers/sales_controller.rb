class SalesController < ApplicationController
  before_action :find_sale, only: [:show, :edit, :update, :destroy]

  def index
    @sales = Sale.all
  end

  def show
  end

  def new
    @sale = Sale.new
  end

  def edit
  end

  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      redirect_to @sale, notice: t('flash.actions.create.notice')
    else
      render :new
    end
  end

  def update
    if @sale.update(sale_params)
      redirect_to @sale, notice: t('flash.actions.update.notice')
    else
      render :edit
    end
  end

  def destroy
    @sale.destroy
    redirect_to sales_url, notice: t('flash.actions.destroy.notice')
  end

  private

    def find_sale
      @sale = Sale.find params[:id]
    end

    def sale_params
      params.require(:sale).permit(:provider_id, :buyer_id, :description, :price, :quantity, :address)
    end
end
