require 'test_helper'

class FridgesControllerTest < ActionController::TestCase
  setup do
    @fridge = fridges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fridges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fridge" do
    assert_difference('Fridge.count') do
      post :create, fridge: { capacity: @fridge.capacity, location: @fridge.location, name: @fridge.name }
    end

    assert_redirected_to fridge_path(assigns(:fridge))
  end

  test "should show fridge" do
    get :show, id: @fridge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fridge
    assert_response :success
  end

  test "should update fridge" do
    put :update, id: @fridge, fridge: { capacity: @fridge.capacity, location: @fridge.location, name: @fridge.name }
    assert_redirected_to fridge_path(assigns(:fridge))
  end

  test "should destroy fridge" do
    assert_difference('Fridge.count', -1) do
      delete :destroy, id: @fridge
    end

    assert_redirected_to fridges_path
  end
end
