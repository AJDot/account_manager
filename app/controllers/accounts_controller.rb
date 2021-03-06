class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update]

  def index
    @accounts = current_holder.accounts
  end

  def show
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.holders << current_holder

    if @account.save
      flash[:notice] = "Your account was created."
      redirect_to accounts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
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

  def set_account
    @account = Account.find params[:id]
  end
end
