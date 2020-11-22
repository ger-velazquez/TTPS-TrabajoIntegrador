module RN 
  module Models
    class Note
      include RN::Modules::Validations
      include RN::Modules::Paths
      include RN::Modules::Eliminator
      include RN::Modules::Renderer

      @instance = new 
  
      private_class_method :new

      def self.instance 
        @instance 
      end

      def add_note(name,book)
        self.verify_root_directory()
        if (self.validate_title(name))
          self.print_successful()
          File.new(self.get_book_path(book) + '/' + self.add_rn_extension(name), 'w' )
        else
          self.print_invalid_title()
        end
      end
      
      def list_notes(book)
        puts Dir.children(book)
        puts '-----------------------------'        
      end
      
      def list_all_notes() #bad smell: procedural way
        self.verify_root_directory()
        all_books = Dir.children(self.get_root_directory_path())
        all_books.each_with_index do |book,index|
          puts "Book title: #{book}"
          self.list_notes(self.get_book_path(book))
        end
      end
      
      def list(book,global) #bad smell: switch statements
        self.verify_root_directory()
        if book.nil? && !global
          self.list_all_notes()
        else
          if global
            self.list_notes(self.get_book_path('Global-Book'))
          else
            if book_exist?(book)
              self.list_notes(self.get_book_path(book))
            else
              self.print_book_not_exist()
            end
          end
        end 
      end
      
      def create(name,book)
        self.verify_root_directory()
        self.note_exist?(name,book) ? self.print_error() : self.add_note(name,book)
      end

      def delete(title,book)
        self.verify_root_directory()
        self.note_exist?(title,book) ? File.delete(self.get_note_path(title,book)) : self.print_note_not_exist()
      end

      def open_editor(title,book)
        system('/bin/nano ' + self.get_note_path(title, book))
      end
      
      def edit(title,book)
        self.note_exist?(title,book) ? self.open_editor(title,book) : self.print_note_not_exist()
      end

      def change_title(old,new_name, book)
        if (self.validate_title(new_name))
          self.print_successful()
          File.rename(self.get_note_path(old, book), self.get_book_path(book) + '/' + add_rn_extension(new_name)  )
        else
          self.print_invalid_title()
        end
      end
      
      def retitle(old_name, new_name, book)
        self.note_exist?(old_name,book) ? self.change_title(old_name, new_name, book) :  self.print_note_not_exist()
      end

      def show(title,book)
        puts title 
        puts book
        if note_exist?(title,book) && book_exist?(book)
          File.foreach(self.get_note_path(title,book)) do |line|
            puts line
          end
        else
          self.print_note_exist()
        end
      end


    end
  end
end