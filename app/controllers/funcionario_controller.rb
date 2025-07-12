class FuncionarioController < ApplicationController
  before_action :authenticate_funcionario!
end
