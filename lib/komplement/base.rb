require 'komplement'

module Komplement
  class Base
    def initialize
      @ignored_elements = @filetypes = @dirs = []
    end

    # which html elements to ignore
    def with_ignored(ignored_a)
      @ignored_elements += ignored_a
      self
    end

    # filetypes to look into for html elements
    def in_filetypes(filetypes_a)
      @filetypes = filetypes_a.map { |e| "*.#{e}" }
      self
    end

    # all the paths we should look into
    def in_dirs(dirs_a)
      @dirs += dirs_a
      self
    end

    # returns 0 on no offenses, else 2
    def run
      [@ignored_elements, @filetypes, @dirs].map { |e| e.uniq! }

      paths = []
      @dirs.each do |dir|
        @filetypes.each do |filetype|
          paths.push File.join(dir, '**', filetype)
        end
      end

      files = []
      paths.each do |path|
        files += Dir.glob(path)
      end

      unknown = Hash.new { |h, k| h[k] = [] }

      files.each do |file|
        contents = File.read(file)
        Nokogiri::HTML(contents).traverse do |node|
          unless @ignored_elements.include? nm = node.name
            unknown[file].push nm
          end
        end
      end

      exit process_output(unknown)
    end

    attr_accessor :ignored_elements
    attr_accessor :filetypes
    attr_accessor :dirs

    private

    # @param unknown_h are the unknown elements that may have been detected
    def process_output(unknown_h)
      if unknown_h.empty?
        $stderr.puts 'No problematic html found'.green.bold
        return EXIT_SUCCESS
      end

      $stderr.puts 'ERROR: Detected possible unknown components:'.red.bold

      unknown_h.each do |file_name, elements|
        $stderr.puts file_name.green.bold
        elements.each do |offending_element_name|
          $stderr.puts "  #{offending_element_name}"
        end
      end

      EXIT_FAIL
    end

    EXIT_SUCCESS = 0
    EXIT_FAIL = 2
  end
end
