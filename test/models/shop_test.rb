require 'test_helper'

class ShopTest < ActiveSupport::TestCase

  def setup
    @shop = shops(:valid)
  end

  test 'valid shop' do
    assert @shop.valid?
  end

  test 'invalid without chain' do
    @shop.chain = nil
    refute @shop.valid?, 'shop is valid without a chain'
    assert_not_nil @shop.errors[:chain], 'no validation error for chain present'
  end

  test 'invalid without name' do
    @shop.name = nil
    refute @shop.valid?, 'shop is valid without a name'
    assert_not_nil @shop.errors[:name], 'no validation error for name present'
  end

  # test 'invalid without latitude' do
  #   @shop.latitude = nil
  #   refute @shop.valid?, 'shop is valid without a latitude'
  #   assert_not_nil @shop.errors[:latitude], 'no validation error for latitude present'
  # end

  # test 'invalid without longitude' do
  #   @shop.longitude = nil
  #   refute @shop.valid?, 'shop is valid without a longitude'
  #   assert_not_nil @shop.errors[:longitude], 'no validation error for longitude present'
  # end

  test 'invalid without address' do
    @shop.address = nil
    refute @shop.valid?, 'shop is valid without a address'
    assert_not_nil @shop.errors[:address], 'no validation error for address present'
  end

  test 'invalid without city' do
    @shop.city = nil
    refute @shop.valid?, 'shop is valid without a city'
    assert_not_nil @shop.errors[:city], 'no validation error for city present'
  end

  # test 'should have unique name' do
  #   shop2 = Shop.new(chain: 'Shopmium', name: 'Shopmium Poissy', latitude: '48.92820769999999' , longitude: '2.0446661', address: '119 rue du General de Gaulle', city: 'Poissy')
  #   shop2.valid?
  #   assert_not_nil shop2.errors[:name], 'no validation error for unique name'
  # end

  test 'latitude should be between -90 and 90' do
    @shop.latitude = -120
    refute @shop.valid?, 'shop is valid with a wrong latitude'
    assert_not_nil @shop.errors[:latitude], 'no validation error for latitude'
  end

  test 'longitude should be between -180 and 180' do
    @shop.longitude = 200
    refute @shop.valid?, 'shop is valid with a wrong longitude'
    assert_not_nil @shop.errors[:longitude], 'no validation error for longitude'
  end

  test 'phone number should be in the right format' do
    @shop.phone = '003006830'
    refute @shop.valid?, 'shop is valid with a wrong phone number'
    assert_not_nil @shop.errors[:phone], 'no validation error for phone number'
  end


end
