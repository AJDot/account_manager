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
      @transaction.amount = params[:transaction][:amount] # reset back to user's input (dollars)
      render :new
    end
  end

  private

  def transaction_params
    strong_params = params.require(:transaction).permit(:kind, :amount, :description)
    # convert from dollar to cents
    strong_params[:amount] = (strong_params[:amount].to_f * 100).to_i.to_s
    strong_params
  end
end
