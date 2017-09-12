require 'test_helper'

class SolucaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solucao = solucaos(:one)
  end

  test "should get index" do
    get solucaos_url, as: :json
    assert_response :success
  end

  test "should create solucao" do
    assert_difference('Solucao.count') do
      post solucaos_url, params: { solucao: { descricao: @solucao.descricao, resultado_id: @solucao.resultado_id, usuario_id: @solucao.usuario_id } }, as: :json
    end

    assert_response 201
  end

  test "should show solucao" do
    get solucao_url(@solucao), as: :json
    assert_response :success
  end

  test "should update solucao" do
    patch solucao_url(@solucao), params: { solucao: { descricao: @solucao.descricao, resultado_id: @solucao.resultado_id, usuario_id: @solucao.usuario_id } }, as: :json
    assert_response 200
  end

  test "should destroy solucao" do
    assert_difference('Solucao.count', -1) do
      delete solucao_url(@solucao), as: :json
    end

    assert_response 204
  end
end
