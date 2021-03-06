class BasketsController < ApplicationController
  before_action :authenticate_user!
  include FileReaderHelper

  def index
    @baskets = current_user.baskets.order(created_at: 'DESC')
  end

  def show
    @basket = Basket.find(params[:id])
    redirect_to new_user_session_path unless @basket.user == current_user
  end

  def new; end

  def create
    flash[:notice] = 'Successfully uploaded the file'
    @basket = file_reader(params[:file])
    redirect_to @basket
  end

  def destroy
    @basket = Basket.find(params[:id])
    @basket.destroy
    flash[:success] = 'You have successfully destroyed the receipt.'
    redirect_to baskets_path
  end
end
