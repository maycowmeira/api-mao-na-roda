require 'test_helper'

class ProblemasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @problema = problemas(:one)
  end

  test "should get index" do
    get problemas_url, as: :json
    assert_response :success
  end

  test "should create problema" do
    assert_difference('Problema.count') do
      post problemas_url, params: { problema: { coordenadas: @problema.coordenadas, descricao: @problema.descricao, solucao_id: @problema.solucao_id, tipo_marcacao_id: @problema.tipo_marcacao_id, usuario_id: @problema.usuario_id } }, as: :json
    end

    assert_response 201
  end

  test "should show problema" do
    get problema_url(@problema), as: :json
    assert_response :success
  end

  test "should update problema" do
    patch problema_url(@problema), params: { problema: { coordenadas: @problema.coordenadas, descricao: @problema.descricao, solucao_id: @problema.solucao_id, tipo_marcacao_id: @problema.tipo_marcacao_id, usuario_id: @problema.usuario_id } }, as: :json
    assert_response 200
  end

  test "should destroy problema" do
    assert_difference('Problema.count', -1) do
      delete problema_url(@problema), as: :json
    end

    assert_response 204
  end
end
