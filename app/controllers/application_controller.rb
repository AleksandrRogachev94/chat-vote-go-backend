require_dependency 'auth'

class AccessDeniedError < StandardError
end
class NotAuthenticatedError < StandardError
end
class AuthenticationTimeoutError < StandardError
end

class ApplicationController < ActionController::API
  attr_reader :current_user

  rescue_from AuthenticationTimeoutError, with: :authentication_timeout
  rescue_from NotAuthenticatedError, with: :user_not_authenticated

  protected

    def logged_in?
      !!current_user
    end

    def authenticate!
      raise NotAuthenticatedError unless auth_token
      user = Auth.decode(auth_token)
      @current_user = User.find(user[:id])

      rescue JWT::ExpiredSignature
        raise AuthenticationTimeoutError
      rescue JWT::VerificationError, JWT::DecodeError, ActiveRecord::RecordNotFound
        raise NotAuthenticatedError
    end

  private

    def auth_token
      # puts request.headers['authorization']
      if request.headers['Authorization'].present?
        @auth_token ||= request.headers['Authorization'].split(' ').last
      end
    end

    def authentication_timeout
      render json: { errors: { auth: ['Authentication Timeout'] } }, status: :unauthorized
    end
    def forbidden_resource
      render json: { errors: { auth: ['Not Authorized To Access Resource'] } }, status: :forbidden
    end
    def user_not_authenticated
      render json: { errors: { auth: ['Not authenticated'] } }, status: :unauthorized
    end
end
