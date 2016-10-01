require 'test_helper'

class MachineResultsControllerTest < ActionController::TestCase
  setup do
    @machine_result = machine_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:machine_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create machine_result" do
    assert_difference('MachineResult.count') do
      post :create, machine_result: { name: @machine_result.name }
    end

    assert_redirected_to machine_result_path(assigns(:machine_result))
  end

  test "should show machine_result" do
    get :show, id: @machine_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @machine_result
    assert_response :success
  end

  test "should update machine_result" do
    patch :update, id: @machine_result, machine_result: { name: @machine_result.name }
    assert_redirected_to machine_result_path(assigns(:machine_result))
  end

  test "should destroy machine_result" do
    assert_difference('MachineResult.count', -1) do
      delete :destroy, id: @machine_result
    end

    assert_redirected_to machine_results_path
  end
end
