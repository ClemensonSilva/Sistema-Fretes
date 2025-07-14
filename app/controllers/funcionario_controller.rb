class FuncionarioController < ApplicationController
  before_action :authenticate_funcionario!
  def show
    @funcionario = Funcionario.find(params[:id])
  end
end
