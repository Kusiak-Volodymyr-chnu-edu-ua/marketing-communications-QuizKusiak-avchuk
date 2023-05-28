class QuestionData
  attr_accessor :collection

  def initialize
    @collection = []
    @yaml_dir = Quiz.instance.yaml_dir
    @in_ext = Quiz.instance.in_ext
    @threads = []
    load_data
  end

  def to_yaml
    collection.map(&:to_h).to_yaml
  end

  def save_to_yaml(filename)
    File.open(filename, 'w') { |file| file.write(to_yaml) }
  end

  def to_json
    collection.map(&:to_h).to_json
  end

  def save_to_json(filename)
    File.open(filename, 'w') { |file| file.write(to_json) }
  end

  def prepare_filename(filename)
    File.expand_path(filename, __dir__)
  end

  def each_file(&block)
    Dir.glob(File.join(@yaml_dir, "*.#{@in_ext}"), &block)
  end

  def in_thread(&block)
    thread = Thread.new(&block)
    @threads << thread
    thread
  end

  def load_data
    each_file do |filename|
      in_thread { load_from(filename) }
    end
    @threads.each(&:join)
  end

  def load_from(filename)
    data = YAML.load_file(filename)
    data.each do | item |
        collection << Question.new( item['question'], item['answers'])
    end
  end
end