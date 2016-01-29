# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BandsController < ApplicationController

  before_action :require_login!

  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def update
    @band = Band.find_by(id: params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    @band.delete
    redirect_to bands_url
  end



  private

  def band_params
    params.require(:band).permit(:name)
  end

end
