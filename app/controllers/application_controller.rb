class ApplicationController < ActionController::Base
    protected
    def ensure_admin
        if !user_signed_in? || !current_user.has_role?(:admin)
            redirect_to(root_path)
            return false
        end
        return true
    end

    def not_found
        raise ActionController::RoutingError.new('Not Found')
    rescue
        render_404
    end

    def render_404
        render file: "#{Rails.root}/public/404", status: :not_found
    end
end
