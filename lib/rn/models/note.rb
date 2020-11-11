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
        if (self.validate_title(a_title))
          self.print_successful()
          File.new(self.get_book_path(book) + '/' + self.add_rn_extension(name), 'w' )
        else
          self.print_invalid_title()
        end
      end
      
      def create(name,book)
        self.note_exist?(name,book) ? self.print_error() : self.add_note(name,book)
      end

      def delete(title,book)
        self.note_exist?(title,book) ? File.delete(self.get_note_path(title,book)) : self.print_note_not_exist()
      end

      def open_editor(title,book)
        system('/bin/nano ' + self.get_note_path(title, book))
      end
      
      def edit(title,book)
        self.note_exist?(title,book) ? self.open_editor(title,book) : self.print_note_not_exist()
      end

      def change_title(old,new_name, book)
        if (self.validate_title(a_title))
          self.print_successful()
          File.rename(self.get_note_path(old, book), self.get_book_path(book) + '/' + new_name  )
        else
          self.print_invalid_title()
        end
      end
      
      def retitle(old_name, new_name, book)
        self.note_exist?(old_name,book) ? self.change_title(old_name, new_name, book) :  self.print_note_not_exist()
      end

    end
  end
end