class TransactionsController < ApplicationController
  before_action :set_account, only: [:new, :create, :edit, :update]
  before_action :set_transaction, only: [:edit, :update]

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.account = @account

    if @transaction.save
      flash[:notice] = "Your transaction was created."
      redirect_to account_path(@account)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @transaction.update(transaction_params)
      flash[:notice] = "Your transaction was successfully updated."
      redirect_to account_path(@account)
    else
      render :edit
    end
  end

  private

  def transaction_params
    strong_params = params.require(:transaction).permit(:kind, :amount, :description)
  end

  def set_transaction
    @transaction = Transaction.find params[:id]
  end

  def set_account
    @account = Account.find params[:account_id]
  end
end
