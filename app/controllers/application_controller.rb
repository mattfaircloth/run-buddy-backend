class ApplicationController < ActionController::API
  def issue_token(payload)
    JWT.encode(payload, ENV["secret_key"], ENV["niffum"])
  end

  def current_user
    begin
      @user = User.find_by(id: user_id)
    rescue
      @user = nil
    end
  end

  def user_id
    decoded_token.first['user_id']
  end

  def decoded_token
    begin
       JWT.decode(request.headers['Authorization'], ENV['secret_key'])
     rescue JWT::DecodeError
      nil
     end
  end
end
