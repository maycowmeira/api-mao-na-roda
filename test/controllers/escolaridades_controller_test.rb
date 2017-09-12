require 'test_helper'

class EscolaridadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escolaridade = escolaridades(:one)
  end

  test "should get index" do
    get escolaridades_url, as: :json
    assert_response :success
  end

  test "should create escolaridade" do
    assert_difference('Escolaridade.count') do
      post escolaridades_url, params: { escolaridade: { descricao: @escolaridade.descricao } }, as: :json
    end

    assert_response 201
  end

  test "should show escolaridade" do
    get escolaridade_url(@escolaridade), as: :json
    assert_response :success
  end

  test "should update escolaridade" do
    patch escolaridade_url(@escolaridade), params: { escolaridade: { descricao: @escolaridade.descricao } }, as: :json
    assert_response 200
  end

  test "should destroy escolaridade" do
    assert_difference('Escolaridade.count', -1) do
      delete escolaridade_url(@escolaridade), as: :json
    end

    assert_response 204
  end
end
