class NotesController < ApplicationController

  before_action :require_login!

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to track_url(@note.track)
    else
      flash.now[:errors] = @note.errors.full_messages
      render :new
    end
  end

  def new
    @note = Note.new
    render :new
  end

  def edit
    @note = Note.find_by(id: params[:id])
    render :edit
  end

  def update
    @note = Note.find_by(id: params[:id])
    if @note.update
      redirect_to track_url(@note.track)
    else
      flash.now[:errors] = @note.errors.full_messages
      render :edit
    end
  end

  def destroy
    @note = Notef.find_by(id: params[:id])
    track = @note.track
    @note.delete
    redirect_to track_url(track)
  end

  private

  def note_params
    params.require(:note).permit(:text, :title, :user_id, :track_id)
  end

end
