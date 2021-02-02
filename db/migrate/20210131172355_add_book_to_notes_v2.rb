class AddBookToNotesV2 < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :book
  end
end
