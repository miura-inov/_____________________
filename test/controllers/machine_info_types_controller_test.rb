require 'test_helper'

class MachineInfoTypesControllerTest < ActionController::TestCase
  setup do
    @machine_info_type = machine_info_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:machine_info_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create machine_info_type" do
    assert_difference('MachineInfoType.count') do
      post :create, machine_info_type: { name: @machine_info_type.name }
    end

    assert_redirected_to machine_info_type_path(assigns(:machine_info_type))
  end

  test "should show machine_info_type" do
    get :show, id: @machine_info_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @machine_info_type
    assert_response :success
  end

  test "should update machine_info_type" do
    patch :update, id: @machine_info_type, machine_info_type: { name: @machine_info_type.name }
    assert_redirected_to machine_info_type_path(assigns(:machine_info_type))
  end

  test "should destroy machine_info_type" do
    assert_difference('MachineInfoType.count', -1) do
      delete :destroy, id: @machine_info_type
    end

    assert_redirected_to machine_info_types_path
  end
end
