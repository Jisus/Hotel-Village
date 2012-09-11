class Admin::DashboardController < Admin::ApplicationController
  
  # GET /dashboard
  def index
    
    @t_clientes = Cliente.count
    @t_produtos = Produto.count
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
