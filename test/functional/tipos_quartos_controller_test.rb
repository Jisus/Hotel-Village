require 'test_helper'

class TiposQuartosControllerTest < ActionController::TestCase
  setup do
    @tipos_quarto = tipos_quartos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_quartos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipos_quarto" do
    assert_difference('TiposQuarto.count') do
      post :create, tipos_quarto: { cama_casal: @tipos_quarto.cama_casal, cama_solteiro: @tipos_quarto.cama_solteiro, nome: @tipos_quarto.nome }
    end

    assert_redirected_to tipos_quarto_path(assigns(:tipos_quarto))
  end

  test "should show tipos_quarto" do
    get :show, id: @tipos_quarto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipos_quarto
    assert_response :success
  end

  test "should update tipos_quarto" do
    put :update, id: @tipos_quarto, tipos_quarto: { cama_casal: @tipos_quarto.cama_casal, cama_solteiro: @tipos_quarto.cama_solteiro, nome: @tipos_quarto.nome }
    assert_redirected_to tipos_quarto_path(assigns(:tipos_quarto))
  end

  test "should destroy tipos_quarto" do
    assert_difference('TiposQuarto.count', -1) do
      delete :destroy, id: @tipos_quarto
    end

    assert_redirected_to tipos_quartos_path
  end
end
