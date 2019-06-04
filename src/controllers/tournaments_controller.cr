class TournamentController < ApplicationController
  getter tournament = Tournament.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_tournament }
  end

  def index
    tournaments = Tournament.all

    respond_with do
      json tournaments.to_json
    end
  end

  def show
    respond_with do
      json tournament.to_json
    end
  end

  def new
    respond_with do
      json tournament.to_json
    end
  end

  def edit
    respond_with do
      json tournament.to_json
    end
  end

  def create
    tournament = Tournament.new tournament_params.validate!
    if tournament.save
      respond_with(201) do
        json tournament.to_json
      end
    else
      respond_with(422) do
        json tournament.errors.map(&.to_s).to_json
      end
    end
  end

  def update
    tournament.set_attributes tournament_params.validate!
    if tournament.save
      respond_with do
        json tournament.to_json
      end
    else
      respond_with(422) do
        json tournament.errors.map(&.to_s).to_json
      end
    end
  end

  def destroy
    tournament.destroy

    respond_with(204) { json "" }
  end

  private def tournament_params
    params.validation do
      required :title
      required :organisation_id
    end
  end

  private def set_tournament
    @tournament = Tournament.find! params[:id]
  end
end
