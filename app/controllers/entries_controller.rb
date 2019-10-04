class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :authorize_entry, except: :index

  def index
    @entries = policy_scope(Entry).order(entry_date: :desc)
  end

  def show
    calories = []
    @entry.foods.each do |food|
      calories << food.calories
    end
    @calories = calories.sum
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to entry_path(@entry)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @entry.update(entry_params)
      redirect_to entry_path(@entry)
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_path
  end

  private

  def entry_params
    params.require(:entry).permit(:entry_date, :food)
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def authorize_entry
    authorize @entry
  end
end
