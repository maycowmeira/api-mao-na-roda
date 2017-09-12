require 'test_helper'

class UsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usuario = usuarios(:one)
  end

  test "should get index" do
    get usuarios_url, as: :json
    assert_response :success
  end

  test "should create usuario" do
    assert_difference('Usuario.count') do
      post usuarios_url, params: { usuario: { ano: @usuario.ano, email: @usuario.email, escolaridade_id: @usuario.escolaridade_id, genero_id: @usuario.genero_id, nome: @usuario.nome, password_digest: @usuario.password_digest, perfil_id: @usuario.perfil_id, profissao: @usuario.profissao, restricao: @usuario.restricao, restricao_outras: @usuario.restricao_outras } }, as: :json
    end

    assert_response 201
  end

  test "should show usuario" do
    get usuario_url(@usuario), as: :json
    assert_response :success
  end

  test "should update usuario" do
    patch usuario_url(@usuario), params: { usuario: { ano: @usuario.ano, email: @usuario.email, escolaridade_id: @usuario.escolaridade_id, genero_id: @usuario.genero_id, nome: @usuario.nome, password_digest: @usuario.password_digest, perfil_id: @usuario.perfil_id, profissao: @usuario.profissao, restricao: @usuario.restricao, restricao_outras: @usuario.restricao_outras } }, as: :json
    assert_response 200
  end

  test "should destroy usuario" do
    assert_difference('Usuario.count', -1) do
      delete usuario_url(@usuario), as: :json
    end

    assert_response 204
  end
end
