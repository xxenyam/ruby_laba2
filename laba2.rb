# Функція для визначення пріоритету оператора
def priority(op)
  case op
  when '+', '-'
    1
  when '*', '/'
    2
  else
    0
  end
end

# Функція для перевірки, чи є символ оператором
def operator?(char)
  ['+', '-', '*', '/'].include?(char)
end

# Основна функція для перетворення у зворотну польську нотацію (RPN) з використанням стека
def to_rpn(expression)
  output = []    # Масив для вихідного виразу в RPN
  stack = []     # Стек для операторів

  # Додаємо пробіли між числами та операторами для коректного розбиття
  expression = expression.gsub(/([+\-*\/\(\)])/,' \1 ')

  expression.split.each do |token|
    if token =~ /\d+/  # Якщо токен - число, додаємо його до виходу
      output << token
    elsif operator?(token)  # Якщо токен - оператор
      while !stack.empty? && priority(stack.last) >= priority(token)
        output << stack.pop
      end
      stack.push(token)  # Кладемо оператор у стек
    elsif token == '('  # Якщо токен - відкриваюча дужка
      stack.push(token)  # Додаємо відкриваючу дужку у стек
    elsif token == ')'  # Якщо токен - закриваюча дужка
      # Витягуємо оператори зі стека, поки не знайдемо відкриваючу дужку
      while !stack.empty? && stack.last != '('
        output << stack.pop
      end
      stack.pop if !stack.empty?  # Витягуємо відкриваючу дужку
    end
  end

  # Виводимо всі оператори, що залишилися у стеку
  output.concat(stack.reverse)

  output.join(' ')  # Повертаємо результат у вигляді рядка
end

# Запитуємо у користувача введення виразу
puts "Введіть математичний вираз:"
expression = gets.chomp

# Виводимо результат у вигляді RPN
puts "Зворотна польська нотація: #{to_rpn(expression)}"
