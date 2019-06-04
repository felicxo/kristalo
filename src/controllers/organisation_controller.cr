class OrganisationController < ApplicationController
  getter organisation = Organisation.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_organisation }
  end

  def index
    organisations = Organisation.all

    respond_with do
      json organisations.to_json
    end
  end

  def show
    respond_with do
      json organisation.to_json
    end
  end

  def new
    respond_with do
      json organisation.to_json
    end
  end

  def edit
    respond_with do
      json organisation.to_json
    end
  end

  def create
    organisation = Organisation.new organisation_params.validate!
    if organisation.save
      respond_with(201) do
        json organisation.to_json
      end
    else
      respond_with(422) do
        json organisation.errors.map(&.to_s).to_json
      end
    end
  end

  def update
    organisation.set_attributes organisation_params.validate!
    if organisation.save
      respond_with do
        json organisation.to_json
      end
    else
      respond_with(422) do
        json organisation.errors.map(&.to_s).to_json
      end
    end
  end

  def destroy
    organisation.destroy

    respond_with(204) { json "" }
  end

  private def organisation_params
    params.validation do
      required :name
      required :cover_image
    end
  end

  private def set_organisation
    @organisation = Organisation.find! params[:id]
  end
end
