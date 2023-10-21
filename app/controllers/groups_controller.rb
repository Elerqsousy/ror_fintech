class GroupsController < ApplicationController
  before_action :set_user
  before_action :set_group, only: %i[show edit update destroy]

  # GET users/1/groups
  def index
    @groups = @user.groups
    @total = current_user.total
  end

  # GET users/1/groups/1
  def show
    @expenses = @group.expenses
  end

  # GET users/1/groups/new
  def new
    @group = @user.groups.build
  end

  # GET users/1/groups/1/edit
  def edit; end

  # POST users/1/groups
  def create
    @group = @user.groups.build(group_params)

    @group.icon = params[:group][:image] if params[:group][:icon].blank? && !params[:group][:image].blank?

    if @group.save
      redirect_to group_path(@group), notice: 'Group was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PUT users/1/groups/1
  def update
    if @group.update(group_params)
      redirect_to([@group.user, @group], notice: 'Group was successfully updated.')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE users/1/groups/1
  def destroy
    @group.destroy

    redirect_to user_groups_url(@user)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  def set_group
    @group = @user.groups.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def group_params
    params.require(:group).permit(:name, :image, :icon, :total)
  end
end
