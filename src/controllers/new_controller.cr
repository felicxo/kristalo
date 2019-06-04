class NewController < ApplicationController
  getter actu = New.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_new }
  end

  def index
    news = New.all

    respond_with do
      json news.to_json
    end
  end

  def show
    respond_with do
      json actu.to_json
    end
  end

  def new
    respond_with do
      json actu.to_json
    end
  end

  def edit
    respond_with do
      json actu.to_json
    end
  end

  def create
    actu = New.new new_params.validate!
    if actu.save
      respond_with(201) do
        json actu.to_json
      end
    else
      respond_with(422) do
        json actu.errors.map(&.to_s).to_json
      end
    end
  end

  def update
    actu.set_attributes new_params.validate!
    if actu.save
      respond_with do
        json actu.to_json
      end
    else
      respond_with(422) do
        json actu.to_json
      end
    end
  end

  def destroy
    actu.destroy

    respond_with(204) { json "" }
  end

  private def new_params
    params.validation do
      required :body
      required :user_id
    end
  end

  private def set_new
    @actu = New.find! params[:id]
  end
end
