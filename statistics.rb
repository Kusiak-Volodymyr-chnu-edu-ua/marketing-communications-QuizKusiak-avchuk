class Statistics
    def initialize(writer)
      @correct_answers = 0
      @incorrect_answers = 0
      @writer = writer
    end
  
    def correct_answer
      @correct_answers += 1
    end
  
    def incorrect_answer
      @incorrect_answers += 1
    end
  
    def print_report
      total_answers = @correct_answers + @incorrect_answers
      accuracy_percentage = (100.0 * @correct_answers / total_answers).round(2)
  
      report = "Test Summary\n"
      report += "Total Questions: #{total_answers}\n"
      report += "Correct Answers: #{@correct_answers}\n"
      report += "Incorrect Answers: #{@incorrect_answers}\n"
      report += "Accuracy: #{accuracy_percentage}%\n"
  
      @writer.write(report)
    end
end