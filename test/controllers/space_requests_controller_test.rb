require 'test_helper'

class SpaceRequestsControllerTest < ActionController::TestCase
  setup do
    @space_request = space_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:space_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create space_request" do
    assert_difference('SpaceRequest.count') do
      post :create, space_request: { budget: @space_request.budget, city: @space_request.city, email: @space_request.email, size: @space_request.size }
    end

    assert_redirected_to space_request_path(assigns(:space_request))
  end

  test "should show space_request" do
    get :show, id: @space_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @space_request
    assert_response :success
  end

  test "should update space_request" do
    patch :update, id: @space_request, space_request: { budget: @space_request.budget, city: @space_request.city, email: @space_request.email, size: @space_request.size }
    assert_redirected_to space_request_path(assigns(:space_request))
  end

  test "should destroy space_request" do
    assert_difference('SpaceRequest.count', -1) do
      delete :destroy, id: @space_request
    end

    assert_redirected_to space_requests_path
  end
end
