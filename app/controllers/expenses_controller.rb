class ExpensesController < ApplicationController
  before_action :set_group
  before_action :set_expense, only: %i[show edit update destroy]

  # GET groups/1/expenses
  def index
    @expenses = @group.expenses
  end

  # GET groups/1/expenses/1
  def show; end

  # GET groups/1/expenses/new
  def new
    @expense = @group.expenses.build
  end

  # GET groups/1/expenses/1/edit
  def edit; end

  # POST groups/1/expenses
  def create
    @expense = @group.expenses.build(expense_params)

    if @expense.save
      redirect_to group_path(@group), notice: 'Expense was successfully created.'
    else
      render action: 'new', status: :unprocessable_entity
    end
  end

  # PUT groups/1/expenses/1
  def update
    if @expense.update_attributes(expense_params)
      redirect_to([@expense.group, @expense], notice: 'Expense was successfully updated.')
    else
      render action: 'edit', status: :unprocessable_entity
    end
  end

  # DELETE groups/1/expenses/1
  def destroy
    @expense.destroy

    redirect_to group_expenses_url(@group)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_expense
    @expense = @group.expenses.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :author_id)
  end
end
