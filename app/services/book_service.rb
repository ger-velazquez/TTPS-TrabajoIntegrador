class BookService
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def get_user_book_by_title(book_title, user_id)
    Book.find_by(:title => book_title, :user_id => user_id)
  end

  def get_all_user_books_titles(user_id)
    Book.where(:user_id => user_id).map { |book| book['title'] }
  end

  def get_notes_associated_amount(book_id)
    NoteService.instance.get_notes_associated_amount(book_id)
  end

  def get_user_books(user_id)
    Book.where(:user_id => user_id)
  end
  
end