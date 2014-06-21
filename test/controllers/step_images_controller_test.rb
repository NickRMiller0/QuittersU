require 'test_helper'

class StepImagesControllerTest < ActionController::TestCase
  setup do
    @step_image = step_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:step_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create step_image" do
    assert_difference('StepImage.count') do
      post :create, step_image: {  }
    end

    assert_redirected_to step_image_path(assigns(:step_image))
  end

  test "should show step_image" do
    get :show, id: @step_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @step_image
    assert_response :success
  end

  test "should update step_image" do
    patch :update, id: @step_image, step_image: {  }
    assert_redirected_to step_image_path(assigns(:step_image))
  end

  test "should destroy step_image" do
    assert_difference('StepImage.count', -1) do
      delete :destroy, id: @step_image
    end

    assert_redirected_to step_images_path
  end
end
