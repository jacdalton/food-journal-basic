class CalorieGoalsController < ApplicationController
  def index
    @calorie_goals = policy_scope(CalorieGoal)
  end

  def show
    @calorie_goal = policy_scope(CalorieGoal).last
    authorize @calorie_goal
  end

  def new
    @calorie_goal = CalorieGoal.new
    authorize @calorie_goal
  end

  def create
    @calorie_goal = CalorieGoal.new(goal_params)
    if @calorie_goal.save
      redirect_to calorie_goal_path(@calorie_goal)
    else
      render 'new'
    end
    authorize @calorie_goal
  end

  private
  def goal_params
    params.require(:calorie_goal).permit(:calories)
  end

end
