class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index; end

  def new; end

  def create
    flash[:notice] = 'Successfully uploaded the file'
    redirect_to root_path
  end
end
