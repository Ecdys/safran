require 'test_helper'

class CouleursControllerTest < ActionController::TestCase
  setup do
    @couleur = couleurs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:couleurs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create couleur" do
    assert_difference('Couleur.count') do
      post :create, couleur: @couleur.attributes
    end

    assert_redirected_to couleur_path(assigns(:couleur))
  end

  test "should show couleur" do
    get :show, id: @couleur.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @couleur.to_param
    assert_response :success
  end

  test "should update couleur" do
    put :update, id: @couleur.to_param, couleur: @couleur.attributes
    assert_redirected_to couleur_path(assigns(:couleur))
  end

  test "should destroy couleur" do
    assert_difference('Couleur.count', -1) do
      delete :destroy, id: @couleur.to_param
    end

    assert_redirected_to couleurs_path
  end
end
