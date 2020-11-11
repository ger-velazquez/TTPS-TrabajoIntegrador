module RN
  module Modules 
    module Validations
      REGEX = /[a-zA-Z0-9]+/
      include RN::Modules::Paths 
      include RN::Modules::Renderer  
       
      def validate_title(a_title)
        return RN::Modules::Validations::REGEX.match?(a_title)
      end

      def create_root_and_global_directory()
        self.print_root_creation()
        Dir.mkdir(ROOT_DIRECTORY)
        Dir.mkdir(ROOT_DIRECTORY + '/' + 'Global-Book')
      end
      
      def verify_root_directory()
        File.exist?(ROOT_DIRECTORY) ? true : self.create_root_and_global_directory()
      end

      def book_exist?(directory)
        return File.exist?(ROOT_DIRECTORY + '/' + directory.to_s)
      end

      def note_exist?(note,book)
        if !self.book_exist?(book)
          self.print_book_not_exist()
          return true
        else 
          return File.exist?(self.get_note_path(note, book))
        end
        
      end


    end
  end
end
