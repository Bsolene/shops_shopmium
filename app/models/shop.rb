class Shop < ApplicationRecord
  validates :chain, :name, :address, :city, presence: true
  validates :latitude , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :phone, format: { with: /(\(\+33\)|0|\+33|0033)[1-9]([0-9]{8}|([0-9\- ]){12})/ }

  geocoded_by :full_address
  after_validation :geocode, if: :address_changed_and_lat_long_nil?


  def full_address
    [address, city].compact.join(', ')
  end

  private

  def address_changed_and_lat_long_nil?
    (latitude.nil? || longitude.nil?) && address_changed?
  end

end
