class ParticipantController < ApplicationController
  getter participant = Participant.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_participant }
  end

  def index
    participants = Participant.all

    respond_with do
      json participants.to_json
    end
  end

  def show
    respond_with do
      json participant.to_json
    end
  end

  def new
    respond_with do
      json participant.to_json
    end
  end

  def edit
    respond_with do
      json participant.to_json
    end
  end

  def create
    participant = Participant.new participant_params.validate!
    if participant.save
      respond_with(201) do
        json participant.to_json
      end
    else
      respond_with(422) do
        json participant.errors.map(&.to_s).to_json
      end
    end
  end

  def update
    participant.set_attributes participant_params.validate!
    if participant.save
      respond_with do
        json participant.to_json
      end
    else
      respond_with(422) do
        json participant.errors.map(&.to_s).to_json
      end
    end
  end

  def destroy
    participant.destroy

    respond_with(204) { json "" }
  end

  private def participant_params
    params.validation do
      required :user_id
      required :tournament_id
    end
  end

  private def set_participant
    @participant = Participant.find! params[:id]
  end
end
