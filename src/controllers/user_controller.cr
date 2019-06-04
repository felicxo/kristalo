class UserController < ApplicationController
  before_action do
    all { redirect_signed_out_user }
  end

  def show
    if user = current_user
      respond_with do
        json user.to_json
      end
    else
      respond_with(403) do
        json({ "error" => "must be logged in" }.to_json)
      end
    end
  end

  def edit
    if user = current_user
      respond_with do
        json user.to_json
      end
    else
      respond_with(403) do
        json({ "error" => "must be logged in" }.to_json)
      end
    end
  end

  def update
    user = current_user
    if update(user)
      respond_with do
        json user.to_json
      end
    elsif user
      respond_with(422) do
        json user.errors.map(&.to_s).to_json
      end
    else
      respond_with(403) do
        json({ "error" => "must be logged in" }.to_json)
      end
    end
  end

  private def update(user)
    return false unless user && user_params.valid?
    user.set_attributes(user_params.to_h)
    user.valid? && user.save
  end

  private def user_params
    params.validation do
      required(:email)
      optional(:password)
    end
  end
end
