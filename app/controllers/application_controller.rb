class ApplicationController < ActionController::Base

  private
  # collection: ActiveRecord_Relation
  # column_names: Array of symbols or strings that represent the attributes I want to extract



  def create_pdf_from(collection, column_names)
    headers = column_names.map { |header| "<font size='12'><b>#{header}</b></font>" }
    attributes = collection.pluck(column_names)

    pdf = Prawn::Document.new
    # The title of the document is the name of the model
    pdf.text collection.klass.name.humanize, align: :center, size: 24

    pdf.table([headers, *attributes], width: pdf.bounds.width, header: true,
              cell_style: {
                borders: %i[top bottom left right], padding: 5,
                size: 10,
                inline_format: true
              })

    pdf.move_down 10
    pdf.text "Rendered #{collection.size} records", align: :right, size: 12
    pdf
  end










  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def after_sign_in_path_for(resource)
      if resource.is_a?(Funcionario)
        case resource.cargo
        when "Motorista"
          motorista_dashboard_path
        when "Gerente"
          gerente_dashboard_path
        else
          root_path
        end
      end
    end
end
