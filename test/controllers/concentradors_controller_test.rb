require 'test_helper'

class ConcentradorsControllerTest < ActionController::TestCase
  setup do
    @concentrador = concentradors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:concentradors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create concentrador" do
    assert_difference('Concentrador.count') do
      post :create, concentrador: { categoria_equipo_id: @concentrador.categoria_equipo_id, descripcion: @concentrador.descripcion, estado: @concentrador.estado, gis_latitud: @concentrador.gis_latitud, gis_longitud: @concentrador.gis_longitud, ip_address: @concentrador.ip_address, ip_port: @concentrador.ip_port, mac_address: @concentrador.mac_address, nombre: @concentrador.nombre, numero_serie: @concentrador.numero_serie }
    end

    assert_redirected_to concentrador_path(assigns(:concentrador))
  end

  test "should show concentrador" do
    get :show, id: @concentrador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @concentrador
    assert_response :success
  end

  test "should update concentrador" do
    patch :update, id: @concentrador, concentrador: { categoria_equipo_id: @concentrador.categoria_equipo_id, descripcion: @concentrador.descripcion, estado: @concentrador.estado, gis_latitud: @concentrador.gis_latitud, gis_longitud: @concentrador.gis_longitud, ip_address: @concentrador.ip_address, ip_port: @concentrador.ip_port, mac_address: @concentrador.mac_address, nombre: @concentrador.nombre, numero_serie: @concentrador.numero_serie }
    assert_redirected_to concentrador_path(assigns(:concentrador))
  end

  test "should destroy concentrador" do
    assert_difference('Concentrador.count', -1) do
      delete :destroy, id: @concentrador
    end

    assert_redirected_to concentradors_path
  end
end
