require 'test_helper'

class MatieresControllerTest < ActionController::TestCase
  setup do
    @matiere = matieres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matieres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matiere" do
    assert_difference('Matiere.count') do
      post :create, matiere: @matiere.attributes
    end

    assert_redirected_to matiere_path(assigns(:matiere))
  end

  test "should show matiere" do
    get :show, id: @matiere.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matiere.to_param
    assert_response :success
  end

  test "should update matiere" do
    put :update, id: @matiere.to_param, matiere: @matiere.attributes
    assert_redirected_to matiere_path(assigns(:matiere))
  end

  test "should destroy matiere" do
    assert_difference('Matiere.count', -1) do
      delete :destroy, id: @matiere.to_param
    end

    assert_redirected_to matieres_path
  end
end
