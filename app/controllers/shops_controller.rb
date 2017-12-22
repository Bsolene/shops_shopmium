class ShopsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present? #search name/city form

      sql_search = "name ILIKE :search OR city ILIKE :search"
      @shops = Shop.where(sql_search, search: "%#{params[:search]}%")

      @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
          marker.lat shop.latitude
          marker.lng shop.longitude
          marker.infowindow render_to_string(partial: "/shops/map_box", locals: { shop: shop })
      end
      respond_to do |format|
        format.html { render 'shops/index' }
        format.js
      end

    elsif params[:distance].present? #search distance form

      @shops = Shop.near(params[:location], params[:distance])
      @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
          marker.lat shop.latitude
          marker.lng shop.longitude
          marker.infowindow render_to_string(partial: "/shops/map_box", locals: { shop: shop })
      end
      respond_to do |format|
        format.html { render 'shops/index' }
        format.js
      end

    else

      @shops = Shop.where.not(latitude: nil, longitude: nil)
      @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
          marker.lat shop.latitude
          marker.lng shop.longitude
          marker.infowindow render_to_string(partial: "/shops/map_box", locals: { shop: shop })
      end
      respond_to do |format|
        format.html { render 'shops/index' }
        format.js
      end

    end

  end


  def show
    @hash = Gmaps4rails.build_markers(@shop) do |shop, marker|
        marker.lat shop.latitude
        marker.lng shop.longitude
        marker.infowindow render_to_string(partial: "/shops/map_box", locals: { shop: shop })
    end
  end

  def new
    @shop = Shop.new
  end

  def create

    @shop = Shop.new(shop_params)
    if (@shop.latitude.nil? || @shop.longitude.nil?) && @shop.address_changed?
      @shop.geocode
    end
    if @shop.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render :edit
    end
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
