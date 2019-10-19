class CalorieGoalsController < ApplicationController
  def index
    @calorie_goals = policy_scope(CalorieGoal)
  end

  def show_goal
    @calorie_goal = policy_scope(CalorieGoal).last
    authorize @calorie_goal
    @new_calorie_goal = CalorieGoal.new
    authorize @new_calorie_goal
  end

  def new
    @calorie_goal = CalorieGoal.new
    authorize @calorie_goal
  end

  def create
    @calorie_goal = CalorieGoal.new(goal_params)
    @calorie_goal.user = current_user
    if @calorie_goal.save
      redirect_to show_goal_path
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
