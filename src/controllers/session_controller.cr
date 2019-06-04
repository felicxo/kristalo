class SessionController < ApplicationController
  def new
    user = User.new

    respond_with do
      json user.to_json
    end
  end

  def create
    user = User.find_by(email: params["email"].to_s)
    if user && user.authenticate(params["password"].to_s)
      session[:user_id] = user.id
      respond_with do
        json({ "successful" => "You are logged in" }.to_json)
      end
    else
      respond_with do
        json({ "error" => "Invalid password" }.to_json)
      end
    end
  end

  def delete
    session.delete(:user_id)

    respond_with(204) { json "" }
  end
end
