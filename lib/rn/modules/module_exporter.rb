module RN 
  module Modules 
    module Exporter
      include RN::Modules::Validations
      include RN::Modules::Paths
      include RN::Modules::Renderer

      def create_export_file(new_content,title,book,type_of_format)
        puts 'ENTRE AL NEW CONTENT'
        self.verify_exporter_book_directory(book)
        new_file_path = self.get_exports_book_path(book) + '/' + self.add_extension(title,type_of_format)
        File.new(new_file_path, 'w' )
        File.write(new_file_path,new_content)
        self.print_export_succefull(new_file_path)
      end
      
      def exporter_export_all_notes(type_of_format)
        

      end

      def exporter_export_note(title,book,type_of_format)
        if type_of_format == 'html'    
          content_to_serialize = File.read(self.get_note_path(title, book)).to_s
          markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
          new_content =  markdown.render(content_to_serialize)
          puts "Contenido html: #{new_content}"
          self.create_export_file(new_content,title,book,type_of_format)
        end
      end

      def exporter_export_notes_from_book(book,type_of_format)

      end
      

    end
  end 
end

#