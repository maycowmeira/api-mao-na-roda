require 'test_helper'

class DificuldadeCodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dificuldade_cod = dificuldade_cods(:one)
  end

  test "should get index" do
    get dificuldade_cods_url, as: :json
    assert_response :success
  end

  test "should create dificuldade_cod" do
    assert_difference('DificuldadeCod.count') do
      post dificuldade_cods_url, params: { dificuldade_cod: { nome: @dificuldade_cod.nome } }, as: :json
    end

    assert_response 201
  end

  test "should show dificuldade_cod" do
    get dificuldade_cod_url(@dificuldade_cod), as: :json
    assert_response :success
  end

  test "should update dificuldade_cod" do
    patch dificuldade_cod_url(@dificuldade_cod), params: { dificuldade_cod: { nome: @dificuldade_cod.nome } }, as: :json
    assert_response 200
  end

  test "should destroy dificuldade_cod" do
    assert_difference('DificuldadeCod.count', -1) do
      delete dificuldade_cod_url(@dificuldade_cod), as: :json
    end

    assert_response 204
  end
end
