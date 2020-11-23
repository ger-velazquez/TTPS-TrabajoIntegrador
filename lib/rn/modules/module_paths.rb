module RN 
  module Modules 
    module Paths
      ROOT_DIRECTORY = File.expand_path("~/my_rns")
      EXPORTS_DIRECTORY = File.expand_path("~/my_rns_exports")

      def get_note_path(a_file, a_directory)
        return ROOT_DIRECTORY + '/' + a_directory.to_s + '/' + add_rn_extension(a_file.to_s)
      end

      def get_book_path(directory)
        return ROOT_DIRECTORY + '/' + directory.to_s
      end


      def get_root_directory_path()
        return ROOT_DIRECTORY
      end

      def add_rn_extension(a_file)
        return a_file + '.rn'
      end

      def get_exports_path()
        return EXPORTS_DIRECTORY
      end

      def get_exports_book_path(directory)
        return EXPORTS_DIRECTORY + '/' + directory.to_s
      end

      def add_extension(file,extension)
        return file + ".#{extension}"
      end
      
    
    end
  end
end