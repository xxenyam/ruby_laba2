# Масив варіантів для вибору гравця та комп'ютера
OPTIONS = ['rock', 'scissors', 'paper']

# Основний ігровий цикл, що продовжується, поки гравець не введе 'exit'
loop do
  # Гравець робить свій вибір
  puts "Ваш вибір (rock, scissors, paper)? або 'exit' для завершення:"
  player_choice = gets.chomp.downcase # Зчитування вводу користувача, приведення до нижнього регістру

  exit if player_choice == 'exit'

  # Перевірка правильності вибору гравця
  if OPTIONS.include?(player_choice)
    computer_choice = OPTIONS.sample # Комп'ютер робить випадковий вибір
    puts "Ви вибрали: #{player_choice}, Комп'ютер вибрав: #{computer_choice}"

    # Визначення результату гри
    if player_choice == computer_choice
      puts 'Нічия!' 
    elsif (player_choice == 'rock' && computer_choice == 'scissors') ||
          (player_choice == 'scissors' && computer_choice == 'paper') ||
          (player_choice == 'paper' && computer_choice == 'rock')
      puts 'Ви виграли!' 
    else
      puts 'Комп\'ютер виграв!' 
    end

    puts '-----------------------------' 
  else
    puts "Невірний вибір, спробуйте знову." 
    next # Перехід до наступної ітерації циклу
  end
end
