class NoteService
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def get_all_notes
    Note.all
  end

  def get_notes_by_book_title(book_title, user_id)
    book_id = BookService.get_user_book_by_title(book_title, user_id).id
    Note.where(:book_id => book_id)
  end

  def get_notes_associated_amount(book_id)
    Note.where(:book_id => book_id).count('id')
  end

end