class BasketsController < ApplicationController
  before_action :authenticate_user!
  include FileReaderHelper

  def index; end

  def show; end

  def new; end

  def create
    flash[:notice] = 'Successfully uploaded the file'
    @basket = file_reader(params[:file])
    redirect_to @basket
  end
end
