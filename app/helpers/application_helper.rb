module ApplicationHelper
  include Pagy::Frontend
  def details_card_header(object, edit_path, title)
      object_id = object.respond_to?(:id) ? object.id : "N/A"

      content_tag(:div, class: "card-header bg-gradient-primary text-white d-flex justify-content-between align-items-center") do
        concat content_tag(:h4) do
          concat title.html_safe
          concat content_tag(:span, "#" + object_id.to_s, class: "badge bg-light text-primary ms-2")
        end

        
        link_content = capture do
          concat content_tag(:i, "", class: "bi bi-pencil-square me-1")
          concat " Editar"
        end
        concat link_to(link_content, edit_path, class: "btn btn-light btn-sm d-flex align-items-center")
      end
    end


  def veiculo_selection_field(form_builder)
    content_tag(:div, class: "mb-3") do
      concat form_builder.label(:veiculo_id, "Veículo", class: "form-label")
      concat form_builder.collection_select(:veiculo_id, Veiculo.all, :id, :placa, { prompt: "Selecione um veículo" }, class: "form-select")
      end
  end

  def botoes_aplicacao(path, tipo, method_or_data = :get, data: {})
    method_verb = :get
    data_attributes = data.dup

    if method_or_data.is_a?(Hash)
      data_attributes.merge!(method_or_data)
    else
      method_verb = method_or_data
    end

    html_options = {
      data: data_attributes
    }

    case tipo.downcase
    when "editar"
      icone = "bi bi-pencil-square me-1"
      cor = "btn-primary"
    when "detalhar"
      icone = "bi bi-eye-fill me-1"
      cor = "btn-success"
    when "excluir"
      icone = "bi bi-trash-fill me-1"
      cor = "btn-danger"
    when "cancelar"
      icone = "bi bi-arrow-left me-1"
      cor = "btn-outline-secondary"
    when "voltar"
      icone = "bi bi-arrow-left me-1"
      cor = "btn-outline-secondary"
    else
      icone = "bi bi-plus-circle me-1"
      cor = "btn-outline-primary"
    end
    if method_verb == :get
      link_to path, html_options.merge(class: "btn #{cor} btn-sm  align-items-center mt-1 ms-1") do
        tag.i(class: icone) + content_tag(:span, tipo)
        end
    else
      button_to path, html_options.merge(method: method_verb, class: "btn #{cor} btn-sm  align-items-center mt-1 ms-1") do
        tag.i(class: icone) + content_tag(:span, tipo)
      end
    end
  end
end
