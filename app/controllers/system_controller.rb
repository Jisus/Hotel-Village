class SystemController < ApplicationController
  def busca_cep
    render json: BuscaEndereco.por_cep(params[:cep])
  end
end
