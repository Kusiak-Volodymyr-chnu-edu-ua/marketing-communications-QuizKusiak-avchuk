class InputReader
  def read(welcome_message: nil, validator: nil, error_message: nil, process: nil)
    puts welcome_message if welcome_message

    loop do
      print '> '
      input = gets.chomp

      if process
        input = process.call(input)
      end

      if validator.nil? || validator.call(input)
        return input
      else
        puts error_message if error_message
      end
    end
  end
end