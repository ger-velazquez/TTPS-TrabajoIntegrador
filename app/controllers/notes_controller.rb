class NotesController < ApplicationController
  include ActionController::Cookies
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    puts '---PARAMETROSS-------'
    puts params.inspect
    puts '===================='
    @filter_book = params[:book].nil? ? 'all' : params[:book]
    @books_titles = BookService.instance.get_all_user_books_titles(current_user.id).to_a.push('all')

    if @filter_book == 'all'
      @notes = NoteService.instance.get_all_notes(current_user.id)
    else
      @notes = NoteService.instance.get_notes_by_book_title(@filter_book, current_user.id)
    end
    book_and_notes = Has.new
    @notes.each do |note|
      book_and_notes # TO DO: OBTENER LOS TITULOS DE CADA NOTE
    end

  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
    @user_books = BookService.instance.get_all_user_books_titles(current_user.id)

  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    book_id = BookService.instance.get_user_book_by_title(params[:note][:book], current_user.id).id

    @note = Note.new(title: note_params[:title], content: note_params[:content], book_id: book_id)
    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:title, :content, :book_id)
    end
end
