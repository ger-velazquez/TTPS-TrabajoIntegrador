module RN 
  module Modules 
    module Paths
      ROOT_DIRECTORY = File.expand_path("~/my_rns")

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
    
    end
  end
end