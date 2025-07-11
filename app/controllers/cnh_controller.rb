class CnhController < ApplicationController
  def index
    @Cnh = Cnh.all
  end
end
