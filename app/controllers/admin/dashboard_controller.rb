class Admin::DashboardController < Admin::ApplicationController
  
  # GET /dashboard
  def index
    
    @t_clientes = Cliente.count
    @t_produtos = Produto.count
    @t_reservas = Reserva.count
    @t_reservas_ativas = Reserva.count(:all, :include => :Checkout, :conditions => { :checkouts => {:id => nil}} )
    
    @u_reservas = Reserva.find(:all, :order => "id desc", :limit => 5)
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
