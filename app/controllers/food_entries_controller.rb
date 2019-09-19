class FoodEntriesController < ApplicationController
  before_action :set_food_entry, only: [:show, :edit, :update, :destroy]

  def index
    @food_entries = FoodEntry.all
  end

  def show
  end

  def new
    @food_entry = FoodEntry.new
  end

  def create
    @food_entry = FoodEntry.new(food_entry_params)
    if @food_entry.save
      redirect_to food_entry_path(@food_entry)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @food_entry.update(food_entry_params)
      redirect_to food_entry_path(@food_entry)
    else
      render :edit
    end
  end

  def destroy
    @food_entry.destroy
    redirect_to food_entries_path
  end

  private

  def food_entry_params
    params.require(:food_entry).permit(:entry_date, :food)
  end

  def set_food_entry
    @food_entry = FoodEntry.find(params[:id])
  end
end
