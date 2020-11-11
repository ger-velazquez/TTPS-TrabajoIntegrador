module RN
  module Modules 
    module Renderer
      
      ERROR_MSG = 'An error was ocurred, this operation can not be executed. Sorry! '
      SUCCESS_MSG = 'The operation was successful ! '
      EMPTY_MSG = 'This collections it is empty ! '
      BOOK_NOT_EXIST = 'This book does not exist '
      INVALID_NAME = 'This name is not valid. Please try with anotherone'
      NOTE_NOT_EXIST = 'This note does not exist'
      ROOT_DIRECTORY_CREATION = 'It seems that you dont have the root directory my_rns. For that, i will create it for you, and also a Global-Notes book'
      NOTE_ALREADY_EXIST = 'It seems that this name its not avaible. Leets choice another one'

      def print_error()
        puts ERROR_MSG
      end

      def print_successful()
        puts SUCCESS_MSG
      end

      def print_invalid_title()
        puts INVALID_NAME
      end
      
      def print_empty()
        puts EMPTY_MSG
      end

      def show_element(element)
        puts element
      end

      def print_book_not_exist()
        puts BOOK_NOT_EXIST
      end

      def print_root_creation()
        puts ROOT_DIRECTORY_CREATION
      end

      def print_note_exist()
        puts NOTE_ALREADY_EXIST
      end

      def print_note_not_exist()
        puts NOTE_NOT_EXIST
      end
  
    
    end
  end
end