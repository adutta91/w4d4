class NotesController < ApplicationController

  before_action :require_login!

  def create
    # ...
  end

  def new
    # ...
  end

  def edit
    # ...
  end

  def show
    @note = Note.find_by(id: params[:id])
    render :note
  end

  def update
    # ...
  end

  def destroy
    # ...
  end

  private

  def note_params
    params.require(:note).permit(:text, :user_id, :track_id)
  end

end
