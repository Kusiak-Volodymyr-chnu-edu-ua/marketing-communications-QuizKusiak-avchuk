require_relative '../lib/load_libraries'

Quiz.instance.config do
    self.yaml_dir = '../quiz/yml'
    self.answers_dir = '../quiz/answers'
    self.in_ext = 'yml'
end

# TODO
QuizBot.instance.config do |quiz_bot|
    quiz_bot.yaml_dir = '../quiz/yml'
    quiz_bot.log_dir = '../log'
end

engine = Engine.new
engine.run
