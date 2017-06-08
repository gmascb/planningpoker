require 'test_helper'

class PokersControllerTest < ActionController::TestCase
  setup do
    @poker = pokers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pokers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poker" do
    assert_difference('Poker.count') do
      post :create, poker: { name: @poker.name, value: @poker.value }
    end

    assert_redirected_to poker_path(assigns(:poker))
  end

  test "should show poker" do
    get :show, id: @poker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poker
    assert_response :success
  end

  test "should update poker" do
    patch :update, id: @poker, poker: { name: @poker.name, value: @poker.value }
    assert_redirected_to poker_path(assigns(:poker))
  end

  test "should destroy poker" do
    assert_difference('Poker.count', -1) do
      delete :destroy, id: @poker
    end

    assert_redirected_to pokers_path
  end
end
