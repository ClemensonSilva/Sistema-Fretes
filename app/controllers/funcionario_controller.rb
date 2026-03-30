class FuncionarioController < ApplicationController
  before_action :authenticate_funcionario!
  def show
    if current_funcionario.motorista?
      @funcionario = current_funcionario
    else
      @funcionario = Funcionario.find(params[:id])
    end
  end

  def edit    

  end

  private

  
end
