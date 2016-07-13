module Support
  module ReadFromFile
    def each_line(&block)
      input_file.each_line do |line|
        puts block.call(line.chomp)
      end
    end

    private

    def input_file
      File.open(file_path, 'r')
    end

    def file_path
      ARGV[0]
    end
  end
end
