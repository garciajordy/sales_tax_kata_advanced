class StaticPagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  include FileReaderHelper

  def index; end

  def new; end

  def create
    flash[:notice] = 'Successfully uploaded the file'
    file_reader(params[:file])
    redirect_to root_path
  end
end
