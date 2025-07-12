class ApplicationController < ActionController::Base
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
