class AddUserToBooksV2 < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :user
  end
end
