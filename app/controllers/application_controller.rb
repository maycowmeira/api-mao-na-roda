class ApplicationController < ActionController::API
  before_action :authenticate_request 
  before_action :open_connection_ssh
  after_action :close_connection_ssh
  attr_reader :current_user 

  private 

  def authenticate_request 
    @current_user = AuthorizeApiRequest.call(request.headers).result 
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user 
  end
  
  def open_connection_ssh
    # http://net-ssh.github.io/net-ssh-gateway/
    @gateway = Net::SSH::Gateway.new('200.134.10.21', 'posttunnel1', password: 'Gr@ngotts').open(5434)
  end
  
  def close_connection_ssh
    @gateway.shutdown!
  end
end
