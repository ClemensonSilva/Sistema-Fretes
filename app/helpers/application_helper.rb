module ApplicationHelper
  def botoes_aplicacao(path, tipo)

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
    end
    # Usa link_to com um bloco para incluir o ícone
    link_to path, class: "btn #{cor} btn-sm  align-items-center mt-1 ms-1" do
      tag.i(class: icone) + content_tag(:span, tipo)
    end
  end
end
