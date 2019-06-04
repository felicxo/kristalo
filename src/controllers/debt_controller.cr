class DebtController < ApplicationController
  getter debt = Debt.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_debt }
  end

  def index
    debts = Debt.all

    respond_with do
      json debts.to_json
    end
  end

  def show
    respond_with do
      json debt.to_json
    end
  end

  def new
    respond_with do
      json debt.to_json
    end
  end

  def edit
    respond_with do
      json debt.to_json
    end
  end

  def create
    debt = Debt.new debt_params.validate!
    if debt.save
      respond_with(201) do
        json debt.to_json
      end
    else
      respond_with(422) do
        json debt.errors.map(&.to_s).to_json
      end
    end
  end

  def update
    debt.set_attributes debt_params.validate!
    if debt.save
      respond_with do
        json debt.to_json
      end
    else
      respond_with(422) do
        json debt.errors.map(&.to_s).to_json
      end
    end
  end

  def destroy
    debt.destroy

    respond_with(204) { json "" }
  end

  private def debt_params
    params.validation do
      required :from_id
      required :to_id
      required :amount
      required :label
    end
  end

  private def set_debt
    @debt = Debt.find! params[:id]
  end
end
