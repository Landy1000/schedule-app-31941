class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
        before_action :authenticate_v1_user!, unless: :devise_controller?

end