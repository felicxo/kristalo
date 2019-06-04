class PhotoController < ApplicationController
  getter photo = Photo.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_photo }
  end

  def index
    photos = Photo.all

    respond_with do
      json photos.to_json
    end
  end

  def show
    respond_with do
      json photo.to_json
    end
  end

  def new
    respond_with do
      json photo.to_json
    end
  end

  def edit
    respond_with do
      json photo.to_json
    end
  end

  def create
    photo = Photo.new photo_params.validate!
    if photo.save
      respond_with(201) do
        json photo.to_json
      end
    else
      respond_with(422) do
        json photo.errors.map(&.to_s).to_json
      end
    end
  end

  def update
    photo.set_attributes photo_params.validate!
    if photo.save
      respond_with do
        json photo.to_json
      end
    else
      respond_with(422) do
        json photo.errors.map(&.to_s).to_json
      end
    end
  end

  def destroy
    photo.destroy

    respond_with(204) { json "" }
  end

  private def photo_params
    params.validation do
      required :storage
      required :organisation_id
    end
  end

  private def set_photo
    @photo = Photo.find! params[:id]
  end
end
