class TransactionsController < ApplicationController
  def new
    @account = Account.find params[:account_id]
    @transaction = Transaction.new
  end

  def create
    @account = Account.find params[:account_id]
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
    @account = Account.find params[:account_id]
    @transaction = Transaction.find params[:id]
  end

  def update
    @account = Account.find params[:account_id]
    @transaction = Transaction.find params[:id]

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
end
