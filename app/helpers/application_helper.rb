module ApplicationHelper

  def veiculo_selection_field(form_builder)
    content_tag(:div, class: "mb-3") do
      concat form_builder.label(:veiculo_id, "Veículo", class: "form-label")
      concat form_builder.collection_select(:veiculo_id, Veiculo.all, :id, :placa, { prompt: "Selecione um veículo" }, class: "form-select")
      end
  end

  # se true, retorna um elemento botao
  def botoes_aplicacao(path, tipo, method_verb = :get)

    case tipo.downcase
    when 'editar'
      icone = "bi bi-pencil-square me-1"
      cor = "btn-primary"
    when 'detalhar'
      icone = "bi bi-eye-fill me-1"
      cor = "btn-success"
    when 'excluir'
      icone = "bi bi-trash-fill me-1"
      cor = "btn-danger"
    when 'cancelar'
      icone = "bi bi-arrow-left me-1"
      cor = "btn-outline-secondary"
    when 'voltar'
      icone = "bi bi-arrow-left me-1"
      cor = 'btn-outline-secondary'
    else
      icone = "bi bi-plus-circle me-1"
      cor = "btn-outline-primary"
    end
    if method_verb == :get
      link_to path, class: "btn #{cor} btn-sm  align-items-center mt-1 ms-1" do
        tag.i(class: icone) + content_tag(:span, tipo)
        end
    else
      button_to path, method: method_verb,class: "btn #{cor} btn-sm  align-items-center mt-1 ms-1" do
        tag.i(class: icone) + content_tag(:span, tipo)
      end
    end


  end
end
