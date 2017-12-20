class Shop < ApplicationRecord
  validates :chain, :name, :address, :city, presence: true
  validates :latitude , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :phone, format: { with: /(\(\+33\)|0|\+33|0033)[1-9]([0-9]{8}|([0-9\- ]){12})/ }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
