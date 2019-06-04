class RegistrationController < ApplicationController
  def new
    user = User.new

    respond_with do
      json user.to_json
    end
  end

  def create
    user = User.new(registration_params.validate!)
    user.password = params["password"].to_s

    if user.valid? && user.save
      respond_with do
        json user.to_json
      end
    else
      respond_with(422) do
        json user.errors.map(&.to_s).to_json
      end
    end
  rescue e : Amber::Exceptions::Validator::ValidationFailed
    respond_with(422) do
      json e.errors.map(&.to_s).to_json
    end
end

  private def registration_params
    params.validation do
      required(:email, msg: nil, allow_blank: true)
      required(:password, msg: nil, allow_blank: true)
    end
  end
end
