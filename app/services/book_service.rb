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
    Book.where(:user_id => user_id).map { |book| book['title'] }.push('all')
  end
  
end