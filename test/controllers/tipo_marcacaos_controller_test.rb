require 'test_helper'

class TipoMarcacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_marcacao = tipo_marcacaos(:one)
  end

  test "should get index" do
    get tipo_marcacaos_url, as: :json
    assert_response :success
  end

  test "should create tipo_marcacao" do
    assert_difference('TipoMarcacao.count') do
      post tipo_marcacaos_url, params: { tipo_marcacao: { descricao: @tipo_marcacao.descricao } }, as: :json
    end

    assert_response 201
  end

  test "should show tipo_marcacao" do
    get tipo_marcacao_url(@tipo_marcacao), as: :json
    assert_response :success
  end

  test "should update tipo_marcacao" do
    patch tipo_marcacao_url(@tipo_marcacao), params: { tipo_marcacao: { descricao: @tipo_marcacao.descricao } }, as: :json
    assert_response 200
  end

  test "should destroy tipo_marcacao" do
    assert_difference('TipoMarcacao.count', -1) do
      delete tipo_marcacao_url(@tipo_marcacao), as: :json
    end

    assert_response 204
  end
end
