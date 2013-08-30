module LessRailsBootstrap
  module Generators
    class CustomBootstrapGenerator < Rails::Generators::Base

      desc 'Generate custom_bootstrap.less for override Twitter Bootstrap variables and mixins'

      def create_custom_bootstrap
        create_file 'app/assets/stylesheets/custom_bootstrap/custom_bootstrap.less' do
          gem_app_dir = File.expand_path('../../../../../app', __FILE__)
          source_file = File.join(gem_app_dir, 'frameworks', 'twitter', 'bootstrap', 'bootstrap.less')

          lines = File.readlines(source_file)

          lines = change_paths_to_less_files(lines)
          lines = insert_custom_less_files(lines)
          lines = insert_header(lines)

          lines.join
        end

        create_file 'app/assets/stylesheets/custom_bootstrap/variables.less', skip: true do
          "// Use this file to override Twitter Bootstrap variables or define own variables.\n"
        end

        create_file 'app/assets/stylesheets/custom_bootstrap/mixins.less', skip: true do
          "// Use this file to override Twitter Bootstrap mixins or define own mixins.\n"
        end
      end

      private

      def insert_header(lines)
        header_lines = []
        header_lines << "// #{'!' * 51}\n"
        header_lines << "// !!! AUTOMATICALLY GENERATED FILE. DO NOT MODIFY !!!\n"
        header_lines << "// #{'!' * 51}\n"
        header_lines << "\n"

        header_lines + lines
      end

      def change_paths_to_less_files(lines)
        lines.each do |line|
          line.gsub!(/(@import ")(.+)(";)/, '\1twitter/bootstrap/\2\3')
        end
      end

      def insert_custom_less_files(lines)
        lines.inject([]) do |result, line|
          result << line

          case line
            when /variables.less/
              result << %Q(@import "custom_bootstrap/variables.less"; // Modify this for custom colors, font-sizes, etc\n)
            when /mixins.less/
              result << %Q(@import "custom_bootstrap/mixins.less"; // Modify this for custom mixins\n)
          end

          result
        end
      end

    end
  end
end


