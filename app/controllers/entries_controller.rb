class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy, :remove_food]
  before_action :authorize_entry, except: [:index, :new, :create]
  after_action :authorize_entry, only: [:new, :create]
  def index
    @entries = policy_scope(Entry)
    @entry = Entry.new
  end

  def show
    @calories = @entry.sum_calories
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    food = insert_food(@entry)
    if @entry.save
      set_quantity(food, @entry)
      redirect_to entry_path(@entry)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    food = insert_food(@entry)
    set_quantity(food, @entry)
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

  def remove_food
    @food = Food.find(params[:food])
    @entry.foods.delete(@food)
    redirect_to :entry
  end

  private

  def entry_params
    params.require(:entry).permit(:entry_date, { foods: [] }, entry_food_attributes: :quantity )
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def authorize_entry
    authorize @entry
  end

  def insert_food(entry)
    food = Food.find(params[:entry][:foods])
    entry.foods << food
    return food
  end

  def set_quantity(food, entry)
    entry_food = EntryFood.where(food: food, entry: entry).first
    entry_food.quantity = params[:entry][:entry_foods][:quantity].to_f
    entry_food.save
  end
end
