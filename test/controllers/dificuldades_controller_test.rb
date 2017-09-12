require 'test_helper'

class DificuldadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dificuldade = dificuldades(:one)
  end

  test "should get index" do
    get dificuldades_url, as: :json
    assert_response :success
  end

  test "should create dificuldade" do
    assert_difference('Dificuldade.count') do
      post dificuldades_url, params: { dificuldade: { dificuldade_cod_id: @dificuldade.dificuldade_cod_id, usuario_id: @dificuldade.usuario_id, valor: @dificuldade.valor } }, as: :json
    end

    assert_response 201
  end

  test "should show dificuldade" do
    get dificuldade_url(@dificuldade), as: :json
    assert_response :success
  end

  test "should update dificuldade" do
    patch dificuldade_url(@dificuldade), params: { dificuldade: { dificuldade_cod_id: @dificuldade.dificuldade_cod_id, usuario_id: @dificuldade.usuario_id, valor: @dificuldade.valor } }, as: :json
    assert_response 200
  end

  test "should destroy dificuldade" do
    assert_difference('Dificuldade.count', -1) do
      delete dificuldade_url(@dificuldade), as: :json
    end

    assert_response 204
  end
end
