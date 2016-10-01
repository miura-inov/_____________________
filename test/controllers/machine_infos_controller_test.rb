require 'test_helper'

class MachineInfosControllerTest < ActionController::TestCase
  setup do
    @machine_info = machine_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:machine_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create machine_info" do
    assert_difference('MachineInfo.count') do
      post :create, machine_info: { name: @machine_info.name }
    end

    assert_redirected_to machine_info_path(assigns(:machine_info))
  end

  test "should show machine_info" do
    get :show, id: @machine_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @machine_info
    assert_response :success
  end

  test "should update machine_info" do
    patch :update, id: @machine_info, machine_info: { name: @machine_info.name }
    assert_redirected_to machine_info_path(assigns(:machine_info))
  end

  test "should destroy machine_info" do
    assert_difference('MachineInfo.count', -1) do
      delete :destroy, id: @machine_info
    end

    assert_redirected_to machine_infos_path
  end
end
