class RoundController < ApplicationController
  getter round = Round.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_round }
  end

  def index
    rounds = Round.all

    respond_with do
      json rounds.to_json
    end
  end

  def show
    respond_with do
      json round.to_json
    end
  end

  def new
    respond_with do
      json round.to_json
    end
  end

  def edit
    respond_with do
      json round.to_json
    end
  end

  def create
    round = Round.new round_params.validate!
    if round.save
      respond_with(201) do
        json round.to_json
      end
    else
      respond_with(422) do
        json round.errors.map(&.to_s).to_json
      end
    end
  end

  def update
    round.set_attributes round_params.validate!
    if round.save
      respond_with do
        json round.to_json
      end
    else
      respond_with(422) do
        json round.errors.map(&.to_s).to_json
      end
    end
  end

  def destroy
    round.destroy

    respond_with(204) { json "" }
  end

  private def round_params
    params.validation do
      required :winner_id
      required :participant_1_id
      required :participant_2_id
      required :previous_round_1_id
      required :previous_round_2_id
    end
  end

  private def set_round
    @round = Round.find! params[:id]
  end
end
