class TravelsController < ApplicationController
  before_action :set_travel, only: %i[show edit update destroy]

  def index
    @travels = Travel.where('user_id = ?', current_user.id).order('created_at DESC')
    @total_distance = @travels.pluck(:distance).sum
  end

  def show
  end

  def new
    @travel = Travel.new
  end

  def edit
  end

  def create
    @travel = current_user.travels.build(travel_params)

    if @travel.save
      @travel.travel_groups.create(show_group_id)
      redirect_to travels_path, notice: 'Travel was successfully created.'
    else
      render 'new', status: :unprocessable_entity
    end

  end

  def update
    if @travel.update(travel_params)

      if show_group_id[:group_id]
        if @travel.groups.empty?
          @travel.travel_groups.create(show_group_id)
        else
          @travel.travel_groups.update(show_group_id)
        end
      end

      redirect_to @travel, notice: "Travel was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @travel.destroy
    redirect_to travels_path, notice: "Travel was successfully destroyed"
  end

  def external_travel
    @travels = Travel.where('user_id = ?', current_user.id).order('created_at DESC')
    @external = @travels.select { |t| t.groups.size.zero? }
    @total_distance = @external.pluck(:distance).sum
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def travel_params
    params.require(:travel).permit(:purpose, :source, :destination, :distance, :user_id, group_ids: [])
  end

  def show_group_id
    params.require(:travel).permit(:group_id)
  end

end
