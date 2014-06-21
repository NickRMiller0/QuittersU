require 'test_helper'

class PinImagesControllerTest < ActionController::TestCase
  setup do
    @pin_image = pin_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pin_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pin_image" do
    assert_difference('PinImage.count') do
      post :create, pin_image: { description: @pin_image.description }
    end

    assert_redirected_to pin_image_path(assigns(:pin_image))
  end

  test "should show pin_image" do
    get :show, id: @pin_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pin_image
    assert_response :success
  end

  test "should update pin_image" do
    patch :update, id: @pin_image, pin_image: { description: @pin_image.description }
    assert_redirected_to pin_image_path(assigns(:pin_image))
  end

  test "should destroy pin_image" do
    assert_difference('PinImage.count', -1) do
      delete :destroy, id: @pin_image
    end

    assert_redirected_to pin_images_path
  end
end
