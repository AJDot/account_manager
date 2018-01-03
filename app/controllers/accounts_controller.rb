class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find params[:id]
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      flash[:notice] = "Your account was created."
      redirect_to accounts_path
    else
      render :new
    end
  end

  def edit
    @account = Account.find params[:id]
  end

  def update
    @account = Account.find params[:id]
    if @account.update(account_params)
      flash[:notice] = "Your account was successfully updated."
      redirect_to account_path(@account)
    else
      render :edit
    end
  end

  private

  def account_params
    params.require(:account).permit(:name, :kind)
  end
end
