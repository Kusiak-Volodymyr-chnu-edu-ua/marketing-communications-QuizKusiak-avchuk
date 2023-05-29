class Quiz
  include Singleton

  attr_accessor :yaml_dir, :in_ext, :answers_dir

  def config(&block)
    instance_eval(&block)
  end
end