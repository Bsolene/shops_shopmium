class Shop < ApplicationRecord
  validates :chain, :name, :latitude, :longitude, :address, :city, presence: true
  validates :name, uniqueness: true
  validates :latitude , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :phone, format: { with: /(\(\+33\)|0|\+33|0033)[1-9]([0-9]{8}|([0-9\- ]){12})/ }
end
