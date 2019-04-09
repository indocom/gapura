class ApplicationController < ActionController::Base
    protected
    def ensure_admin
        if !user_signed_in? || !current_user.has_role?(:admin)
            redirect_to(root_path)
            return false
        end
        return true
    end
end
