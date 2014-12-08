class HabitsController < ApplicationController
  def index
    @habits = Habit.all
  end

  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)
    if @habit.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def habit_params
    params.require(:habit).permit(:name)
  end
end
