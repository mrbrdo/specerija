require 'test_helper'

class MigrationsControllerTest < ActionController::TestCase
  setup do
    @__migration = __migrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:__migrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create __migration" do
    assert_difference('Migration.count') do
      post :create, __migration: { Item: @__migration.Item, false: @__migration.false, price: @__migration.price, title: @__migration.title }
    end

    assert_redirected_to __migration_path(assigns(:__migration))
  end

  test "should show __migration" do
    get :show, id: @__migration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @__migration
    assert_response :success
  end

  test "should update __migration" do
    put :update, id: @__migration, __migration: { Item: @__migration.Item, false: @__migration.false, price: @__migration.price, title: @__migration.title }
    assert_redirected_to __migration_path(assigns(:__migration))
  end

  test "should destroy __migration" do
    assert_difference('Migration.count', -1) do
      delete :destroy, id: @__migration
    end

    assert_redirected_to __migrations_path
  end
end
