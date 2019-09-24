class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = policy_scope(Entry).order(entry_date: :desc).group_by { |entry| entry.entry_date.to_date }
    # @foods = @entries.each do |date, entries|
    #   entries.each do |entry|
    #     entry.foods.each do |food|
    #       policy_scope(food)
    #     end
    #   end
    # end
  end

  def show
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
    @entry = FoodEntry.find(params[:id])
  end
end
