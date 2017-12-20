require 'test_helper'

class ShopsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @shop = shops(:valid)
  end

  test "should get index" do
    get shops_url
    assert_response :success
    assert_not_nil assigns(:shops)
  end

  test "should get new" do
    get new_shop_url
    assert_response :success
  end

  test "should create shop" do
    assert_difference('Shop.count') do
      post shops_url, params: { shop: { chain: @shop.chain, name: @shop.name, address: @shop.address, city: @shop.city } }
    end
    assert_redirected_to shop_path(Shop.last)
  end

  test "should show shop" do
    get shop_url(@shop)
    assert_response :success
  end

  test "should get edit" do
    get edit_shop_url(@shop)
    assert_response :success
  end

  test "should update shop" do
    patch shop_url(@shop), params: { shop: { name: 'updated' } }
    assert_redirected_to shop_path(assigns(:shop))
    @shop.reload
    assert_equal "updated", @shop.name
  end

  test "should destroy shop" do
    assert_difference('Shop.count', -1) do
      delete shop_url(@shop)
    end

    assert_redirected_to shops_path
  end

end
