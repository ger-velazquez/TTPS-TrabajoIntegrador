class NotesController < ApplicationController
  include ActionController::Cookies
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @filter_book = params[:book].nil? ? 'all' : params[:book]
    user_books = BookService.instance.get_all_user_books(current_user.id).to_a

    if @filter_book == 'all'
      @notes = NoteService.instance.get_all_notes(current_user.id)
    else
      @notes = NoteService.instance.get_notes_by_book_title(@filter_book, current_user.id)
    end

    @books_and_notes_titles = {}
    @notes.each do |note|
      title = user_books.detect { |book| note['book_id'] == book.id }.title
      @books_and_notes_titles.store(note.id, title)
    end

    @books_titles =user_books.map { |book| book.title }.push('all')

  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
    @user_books = BookService.instance.get_all_user_books(current_user.id).map { |book| book['title'] }

  end

  # GET /notes/1/edit
  def edit
    @user_books = BookService.instance.get_all_user_books(current_user.id).map { |book| book['title'] }
    @note = Note.find_by_id(params[:id])
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
      format.html { redirect_to notes_url, notice: 'Note was successfully deleted.' }
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
