class NoteService
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def get_all_notes(user_id)
    result = []
    sql_query = "SELECT n.id " + 
                "FROM books b INNER JOIN users u on u.id = b.user_id " +
                "INNER JOIN notes n on n.book_id = b.id " + 
                "WHERE user_id = #{user_id} "
    records_array = ActiveRecord::Base.connection.exec_query(sql_query).to_a
    result = records_array.map { |note|
      Note.find_by_id(note['id'])
    }

    result
  end

  def get_notes_by_book_title(book_title, user_id)
    book_id = BookService.instance.get_user_book_by_title(book_title, user_id).id
    Note.where(:book_id => book_id)
  end

  def get_notes_associated_amount(book_id)
    Note.where(:book_id => book_id).count('id')
  end

end

# sql_query = "SELECT * " + 
# "FROM books b INNER JOIN users u on u.id = b.user_id " +
# "INNER JOIN notes n on n.book_id = b.id"