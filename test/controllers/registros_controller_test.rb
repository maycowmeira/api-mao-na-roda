require 'test_helper'

class RegistrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registro = registros(:one)
  end

  test "should get index" do
    get registros_url, as: :json
    assert_response :success
  end

  test "should create registro" do
    assert_difference('Registro.count') do
      post registros_url, params: { registro: { descricao: @registro.descricao, foto_url: @registro.foto_url, problema_id: @registro.problema_id } }, as: :json
    end

    assert_response 201
  end

  test "should show registro" do
    get registro_url(@registro), as: :json
    assert_response :success
  end

  test "should update registro" do
    patch registro_url(@registro), params: { registro: { descricao: @registro.descricao, foto_url: @registro.foto_url, problema_id: @registro.problema_id } }, as: :json
    assert_response 200
  end

  test "should destroy registro" do
    assert_difference('Registro.count', -1) do
      delete registro_url(@registro), as: :json
    end

    assert_response 204
  end
end
