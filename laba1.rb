# Масив варіантів для вибору гравця та комп'ютера
OPTIONS = ['rock', 'scissors', 'paper']

# Основний ігровий цикл, що продовжується, поки гравець не введе 'exit'
loop do

  puts "Ваш вибір (rock, scissors, paper)? або 'exit' для завершення:"
  player_choice = gets.chomp.downcase # Зчитування вводу користувача, приведення до нижнього регістру


  exit if player_choice == 'exit'

  # Перевірка правильності вибору гравця
  if OPTIONS.include?(player_choice)

    computer_choice = OPTIONS[rand(0..2)]
    # Комп'ютер робить випадковий вибір із масиву варіантів
    puts "Ваш вибір: #{player_choice}, Комп'ютер вибрав: #{computer_choice}"

    # Логіка визначення результату гри
    case [player_choice, computer_choice]
    when ['rock', 'scissors'], ['scissors', 'paper'], ['paper', 'rock']
      puts 'Ви виграли!' 
    when [computer_choice, player_choice]
      puts 'Нічия!'
    else
      puts 'Комп\'ютер виграв!' 
    end

    puts '-----------------------------' 
  else
 
    puts "Невірний вибір, спробуйте знову." 
    next # Перехід до наступної ітерації циклу
  end
end
