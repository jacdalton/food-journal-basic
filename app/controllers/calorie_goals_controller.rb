class CalorieGoalsController < ApplicationController
  before_action :set_goal, only: :show

  def index
    @calorie_goals = CalorieGoal.all
  end

  def show
    @calorie_goal = CalorieGoal.find(params[:id])
  end

  def new
    @calorie_goal = CalorieGoal.new
  end

  def create
    @calorie_goal = CalorieGoal.new(goal_params)
    if @calorie_goal.save
      redirect_to calorie_goal_path(@calorie_goal)
    else
      render 'new'
    end
  end

  private
  def goal_params
    params.require(:calorie_goal).permit(:calories)
  end

end
