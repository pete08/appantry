class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_user
    # User.find_by(id: 6)
    auth_headers = request.headers["Authorization"]
    p auth_headers
    
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      p token
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        p decoded_token
        User.find_by(id: decoded_token[0]["user_id"])
        p User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end

  end

  helper_method :current_user

  def authenticate_user
    unless current_user
      render json: {Note: "Unauthorized action without appropriate login"}, status: :unauthorized
    end
  end

end
