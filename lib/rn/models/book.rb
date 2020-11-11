module RN
  module Models
    class Book
      include RN::Modules::Validations
      include RN::Modules::Paths
      include RN::Modules::Eliminator
      include RN::Modules::Renderer
      
      @instance = new 
  
      private_class_method :new

      def self.instance 
        @instance 
      end
      
      def create(name)
        self.verify_root_directory()
        self.validate_title(name) && !self.book_exist?(name) ? Dir.mkdir(ROOT_DIRECTORY + '/' + name.to_s) : self.print_error()
      end
      
      def list()
        array_of_books = Dir.children(self.get_root_directory_path())
        array_of_books.empty? ? self.print_empty() : self.show_element(array_of_books)
      end
      
      def delete(name,global)
        self.verify_root_directory()
        if global 
          self.eliminate_global_notes()
        end
        if !name.nil? && self.book_exist?(name)
          self.delete_book(name)
        end
      end

      def rename(old_name,new_name)
        self.verify_root_directory()
        if self.book_exist?(old_name)
          File.rename(self.get_book_path(old_name), self.get_book_path(new_name))
          self.print_successful()
        else 
          self.print_book_not_exist()
        end
      end



    end 
  end
end
