require 'test_helper'

class UltimaConsultaControllerTest < ActionController::TestCase
  setup do
    @ultima_consultum = ultima_consulta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ultima_consulta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ultima_consultum" do
    assert_difference('UltimaConsultum.count') do
      post :create, ultima_consultum: { data_ultima_consulta: @ultima_consultum.data_ultima_consulta }
    end

    assert_redirected_to ultima_consultum_path(assigns(:ultima_consultum))
  end

  test "should show ultima_consultum" do
    get :show, id: @ultima_consultum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ultima_consultum
    assert_response :success
  end

  test "should update ultima_consultum" do
    patch :update, id: @ultima_consultum, ultima_consultum: { data_ultima_consulta: @ultima_consultum.data_ultima_consulta }
    assert_redirected_to ultima_consultum_path(assigns(:ultima_consultum))
  end

  test "should destroy ultima_consultum" do
    assert_difference('UltimaConsultum.count', -1) do
      delete :destroy, id: @ultima_consultum
    end

    assert_redirected_to ultima_consulta_path
  end
end
