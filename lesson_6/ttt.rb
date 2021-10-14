require 'pry'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(array, delimiter=', ', word='or')
  case array.size
  when 0 then ''
  when 1 then array.first
  when 2 then array.join(" #{word} ")
  else
    array[-1] = "#{word} #{array.last}"
    array.join(delimiter)
  end
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, player_wins=0, computer_wins=0)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "Player: #{player_wins}  Computer: #{computer_wins}"
  puts "First to reach 5 wins is the Grand Champion!"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# rubocop:disable Layout/LineLength
def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end
# rubocop:enable Layout/LineLength

def computer_places_piece!(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if empty_squares(brd).include?(5)
    square = 5
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

# rubocop:disable Style/EmptyElse
def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end
# rubocop:enable Style/EmptyElse

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def update_wins(brd, player, computer)
  if someone_won?(brd)
    if detect_winner(brd) == 'Player'
      player += 1
    elsif detect_winner(brd) == 'Computer'
      computer += 1
    end
  end
  return player, computer
end

loop do
  player_wins = 0
  computer_wins = 0

  loop do
    system 'clear'
    board = intialize_board

    loop do
      loop do
        display_board(board, player_wins, computer_wins)
        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
      end

      display_board(board, player_wins, computer_wins)

      player_wins, computer_wins = update_wins(board, player_wins, computer_wins)

      if someone_won?(board)
        puts "#{detect_winner(board)} won!"
      else
        prompt "It's a tie!"
      end

      break if player_wins == 5 || computer_wins == 5

      prompt "Push any key to start next game."
      gets.chomp
      break
    end

    if player_wins == 5
      system 'clear'
      prompt "Player is the Grand Champion!"
      prompt "With a score of Player: #{player_wins} Computer:#{computer_wins}"
      break
    elsif computer_wins == 5
      system 'clear'
      prompt "Computer is the Grand Champion!"
      prompt "With a score of Computer: #{computer_wins} Player:#{player_wins}"
      break
    end
    # binding.pry
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
system 'clear'
prompt "Thanks for playing tic-tac-toe! Goodbye"
