class BasketsController < ApplicationController
  before_action :authenticate_user!
  include FileReaderHelper

  def index
    @baskets = current_user.baskets
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
end
