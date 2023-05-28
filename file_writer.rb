class FileWriter
    def initialize(mode, *args)
      @answers_dir = args[0]
      @filename = args[1] + '.txt'
      @mode = mode
    end
  
    def write(message)
      File.open( prepare_filename( @filename ), 'a+:utf-8' ) do |file|
        file.write(message)
      end
    end
  
    def prepare_filename(filename)
      full_path = File.expand_path(filename, @answers_dir)
       
      unless File.exist?(full_path)
        File.open(full_path, 'w:utf-8') {}
      end
    
      full_path
    end
end