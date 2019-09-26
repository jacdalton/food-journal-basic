class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  def index
    @foods = policy_scope(Food)
  end

  def show
    authorize_food
  end

  def new
    @food = Food.new
    authorize_food
  end

  def create
    @food = Food.new(food_params)
    authorize_food
    @food.user = current_user
    if @food.save
      redirect_to food_path(@food)
    else
      render :new
    end
  end

  def edit
    authorize_food
  end

  def update
    authorize_food
    if @food.update(food_params)
      redirect_to food_path(@food)
    else
      render :edit
    end
  end

  def destroy
    authorize_food
    @food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories, :portion_size, :notes)
  end

  def set_food
    @food = Food.find(params[:id])
  end

  def authorize_food
    authorize @food
  end

end
