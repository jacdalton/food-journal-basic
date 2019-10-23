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
    food = Food.find(params[:entry][:foods])
    @entry.foods << food
    if @entry.save
      respond_to do |format|
        format.html { redirect_to entry_path(@entry) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'entries/new' }
        format.js
      end
    end
  end

  def edit
  end

  def update
    food = Food.find(params[:entry][:foods])
    @entry.foods << food
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
    params.require(:entry).permit(:entry_date, { foods: [] } )
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def authorize_entry
    authorize @entry
  end
end
