module RN 
  module Modules 
    module Eliminator
      include RN::Modules::Paths
      require 'fileutils'

      def eliminate_global_notes()
        self.delete_notes('Global-Book')
      end

      def delete_notes(a_directory)
         Dir.children(self.get_book_path(a_directory)).collect {
           |file| File.delete(self.get_note_path(file,a_directory)) }
      end

      def delete_book(name)
        FileUtils.rm_rf(self.get_book_path(name))
      end
    
    end
  end
end