require 'test_helper'

class CategoriaEquiposControllerTest < ActionController::TestCase
  setup do
    @categoria_equipo = categoria_equipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoria_equipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categoria_equipo" do
    assert_difference('CategoriaEquipo.count') do
      post :create, categoria_equipo: { descripcion: @categoria_equipo.descripcion, nombre: @categoria_equipo.nombre }
    end

    assert_redirected_to categoria_equipo_path(assigns(:categoria_equipo))
  end

  test "should show categoria_equipo" do
    get :show, id: @categoria_equipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categoria_equipo
    assert_response :success
  end

  test "should update categoria_equipo" do
    patch :update, id: @categoria_equipo, categoria_equipo: { descripcion: @categoria_equipo.descripcion, nombre: @categoria_equipo.nombre }
    assert_redirected_to categoria_equipo_path(assigns(:categoria_equipo))
  end

  test "should destroy categoria_equipo" do
    assert_difference('CategoriaEquipo.count', -1) do
      delete :destroy, id: @categoria_equipo
    end

    assert_redirected_to categoria_equipos_path
  end
end
