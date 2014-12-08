class HabitsController < ApplicationController
  before_action :set_habit, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @habit.update(habit_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    if @habit.destroy
      redirect_to root_url
    end

  end

  private

  def set_habit
    @habit = Habit.find(params[:id])
  end

  def habit_params
    params.require(:habit).permit(:name)
  end
end
