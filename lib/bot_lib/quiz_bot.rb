class QuizBot
  include Singleton

  attr_accessor :yaml_dir, :log_dir

  def config(&block)
    instance_eval(&block)
  end
end