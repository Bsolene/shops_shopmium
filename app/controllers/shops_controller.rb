class ShopsController < ApplicationController

  before_action :set_shop, only: [:show, :edit, :update, :destroy]


  def index
    @shops = Shop.where.not(latitude: nil, longitude: nil)

    @markers = @shops.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude,
        infoWindow: { content: render_to_string(partial: "/shops/map_box", locals: { shop: shop }) }
      }
    end

  end

  def show
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save
    if @shop.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @shop.update(shop_params)
    redirect_to shop_path(@shop)
  end

  def destroy
    @shop.destroy
    redirect_to shops_path
  end

  private

  def shop_params
    params.require(:shop).permit(:chain, :name, :latitude, :longitude, :address, :city, :phone, :zip, :country_code)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
