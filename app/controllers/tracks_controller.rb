# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  album_id   :integer          not null
#  style      :string           not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TracksController < ApplicationController
  before_action :require_login!

  def new
    # ...
  end

  def create
    # ...
  end

  def edit
    # ...
  end

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def update
    # ...
  end

  def destroy
    # ...
  end
end
