class BuyersController < ApplicationController
  before_action :find_buyer, only: [:show, :edit, :update, :destroy]

  def index
    @buyers = Buyer.all
  end

  def show
  end

  def new
    @buyer = Buyer.new
  end

  def edit
  end

  def create
    @buyer = Buyer.new(buyer_params)

    if @buyer.save
      redirect_to @buyer, notice: t('flash.actions.create.notice')
    else
      render :new
    end
  end

  def update
    if @buyer.update(buyer_params)
      redirect_to @buyer, notice: t('flash.actions.update.notice')
    else
      render :edit
    end
  end

  def destroy
    @buyer.destroy
    redirect_to buyers_url, notice: t('flash.actions.destroy.notice')
  end

  private

    def find_buyer
      @buyer = Buyer.find params[:id]
    end

    def buyer_params
      params.require(:buyer).permit(:name)
    end
end
