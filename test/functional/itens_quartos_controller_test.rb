require 'test_helper'

class ItensQuartosControllerTest < ActionController::TestCase
  setup do
    @itens_quarto = itens_quartos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itens_quartos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itens_quarto" do
    assert_difference('ItensQuarto.count') do
      post :create, itens_quarto: { nome: @itens_quarto.nome }
    end

    assert_redirected_to itens_quarto_path(assigns(:itens_quarto))
  end

  test "should show itens_quarto" do
    get :show, id: @itens_quarto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itens_quarto
    assert_response :success
  end

  test "should update itens_quarto" do
    put :update, id: @itens_quarto, itens_quarto: { nome: @itens_quarto.nome }
    assert_redirected_to itens_quarto_path(assigns(:itens_quarto))
  end

  test "should destroy itens_quarto" do
    assert_difference('ItensQuarto.count', -1) do
      delete :destroy, id: @itens_quarto
    end

    assert_redirected_to itens_quartos_path
  end
end
