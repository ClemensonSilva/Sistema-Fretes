class AbastecimentosController < ApplicationController
  include ActionView::Helpers::NumberHelper # Para number_to_currency, number_with_precision
  def show
    @abastecimento = Abastecimento.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = nota_abastecimento_pdf(@abastecimento)
        send_data pdf.render, filename: 'nota_abastecimento.pdf', type: 'application/pdf'
      end
    end
  end

  def index
    @abastecimentos = Abastecimento.all

    respond_to do |format|
      format.html
      format.pdf do
        pdf = create_pdf_from(@abastecimentos, %i[veiculo_id preco_litro quantidade_litros data_abastecimento])
        send_data pdf.render, filename: 'abastecimentos.pdf', type: 'application/pdf'
      end
    end
  end

  def edit
    @abastecimento = Abastecimento.find(params[:id])
  end

  def new
    @abastecimento = Abastecimento.new
  end

  def create
    @abastecimento = Abastecimento.new(abastecimento_params)

    if @abastecimento.save
      redirect_to @abastecimento, notice: "Abastecimento criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def new
    @abastecimento = Abastecimento.new
  end
  # adicionar rescue para tratamento de erros
  def update
    @abastecimento = Abastecimento.find(params[:id])
    @abastecimento.update(abastecimento_params)
    if @abastecimento.update(abastecimento_params)
      redirect_to abastecimento_path, notice: "Edição concluida com sucesso."
    else
      render "edit", status: :unprocessable_entify
    end
  end

  def destroy
    @abastecimento = Abastecimento.find(params[:id])
    @abastecimento.destroy
    redirect_to lista_abastecimentos_path, notice: "Abastecimento excluído com sucesso."
  end

  private
  def abastecimento_params
    params.require(:abastecimento).permit(:tipo_combustivel, :data_abastecimento,
      :quantidade_litros, :preco_litro, :nome_posto)
  end

  # Péssima prática: devo mover esse metodo para uma camada de serviços
  private
  def nota_abastecimento_pdf(abastecimento)
    pdf = Prawn::Document.new

    # Título da Nota
    pdf.text "NOTA DE ABASTECIMENTO", align: :center, size: 28, style: :bold
    pdf.move_down 15
    pdf.text "ID do Abastecimento: ##{abastecimento.id}", align: :center, size: 14, style: :bold
    pdf.move_down 20

    # Informações Principais do Abastecimento (blocos de texto ou parágrafos)
    pdf.font_size 12
    pdf.text "<b>Posto:</b> #{abastecimento.nome_posto}", inline_format: true
    pdf.text "<b>Data:</b> #{l(abastecimento.data_abastecimento, format: :long)}", inline_format: true
    pdf.move_down 10

    # Seções claras para Veículo e Combustível
    pdf.text "<u><b>Dados do Veículo:</b></u>", inline_format: true
    if abastecimento.veiculo.present?
      pdf.text "  <b>Placa:</b> #{abastecimento.veiculo.placa}", inline_format: true
      pdf.text "  <b>Modelo:</b> #{abastecimento.veiculo.modelo}", inline_format: true
    else
      pdf.text "  Veículo: Não informado", inline_format: true
    end
    pdf.move_down 10
    # Esta prática de usar o view_context é u
    pdf.text "<u><b>Detalhes do Combustível:</b></u>", inline_format: true
    pdf.text "  <b>Tipo:</b> #{Abastecimento.human_attribute_name("_#{abastecimento.tipo_combustivel}")}", inline_format: true
    pdf.text "  <b>Quantidade:</b> #{number_with_precision(abastecimento.quantidade_litros, precision: 2, separator: ',', delimiter: '.')} L", inline_format: true
    pdf.text "  <b>Preço por Litro:</b> #{number_to_currency(abastecimento.preco_litro, unit: 'R$', separator: ',', delimiter: '.')}", inline_format: true
    pdf.move_down 15

    # Total (Destacado)
    pdf.text "<b>TOTAL GERAL: #{number_to_currency(abastecimento.quantidade_litros * abastecimento.preco_litro, unit: 'R$', separator: ',', delimiter: '.')}</b>",
             align: :right, size: 18, style: :bold, inline_format: true
    pdf.move_down 30

    # Rodapé simples
    pdf.font_size 9
    pdf.text "Documento gerado em #{l(Time.current, format: :long)}", align: :center, color: "666666"
    pdf.text "Gerado por #{current_funcionario.nome}, Gmail: #{current_funcionario.email}", align: :center, color: "666666"
    pdf
  end

end
