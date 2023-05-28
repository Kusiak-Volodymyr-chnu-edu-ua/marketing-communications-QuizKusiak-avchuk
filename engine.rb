class Engine
    def initialize
      @question_collection = load_question_collection
      @input_reader = InputReader.new
      @user_name = @input_reader.read(welcome_message: 'Enter your name:')
      @current_time = Time.now.strftime('%Y-%m-%d %H:%M:%S')
      @writer = FileWriter.new( 'nomode', Quiz.instance.answers_dir, @user_name)
      @statistics = Statistics.new(@writer)
    end
  
    def run
      @question_collection.each do |question|
        display_question(question)
        user_answer = get_answer_by_char(question)
        check(user_answer, question.question_correct_answer)
      end
  
      @statistics.print_report
    end
  
    private
  
    def load_question_collection
        question_data = QuestionData.new
        question_data.load_data
        question_data.collection
    end
  
    def display_question(question)
      puts "Question: #{question.to_s}"
      puts "Possible answers:"
      question.display_answers.each { |answer| puts answer }
    end
  
    def get_answer_by_char(question)
      user_answer = @input_reader.read(welcome_message: 'Enter your answer:')
      question.find_answer_by_char(user_answer[0].upcase)
    end
  
    def check(user_answer, correct_answer)
      if user_answer == correct_answer
        @statistics.correct_answer
      else
        @statistics.incorrect_answer
      end
    end
end