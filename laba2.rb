class ResPolishNotation
  # Метод для конвертації звичайного виразу у зворотну польську нотацію
  def rpn(expression)
    output = []
    operators = []
    precedence = { "+" => 1, "-" => 1, "*" => 2, "/" => 2, "**" => 3 }

    expression.scan(/\d+|[-+*\/()]/).each do |token|
      case token
      when /\d/
        output.push(token)
      when "+", "-", "*", "/", "**"
        while !operators.empty? && precedence[operators.last] >= precedence[token]
          output.push(operators.pop)
        end
        operators.push(token)
      when "("
        operators.push(token)
      when ")"
        while operators.last != "("
          output.push(operators.pop)
        end
        operators.pop
      end
    end

    output.concat(operators.reverse) # Додаємо всі залишкові оператори
    output.join(" ")
  end
end

# Використання класу
calculator = ResPolishNotation.new

puts "Введіть математичний вираз:"
expression = gets.chomp

# Конвертуємо у зворотну польську нотацію
rpn_exp = calculator.rpn(expression)
puts "Зворотна польська нотація: #{rpn_exp}"

