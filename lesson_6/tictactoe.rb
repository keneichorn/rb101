require 'pry'

PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
INITIAL_MARKER = ' '
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]


def prompt(string)
  puts "=> #{string}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, player_score, computer_score)
  system 'clear'
  puts "   *** You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER} ***"
  puts "*** Player score: #{player_score} *** Computer score: #{computer_score} ***"
  puts '       First to 5 wins is the Champion'
  puts ''
  puts "                |     |"
  puts "             #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "                |     |"
  puts "           -----+-----+-----"
  puts "                |     |"
  puts "             #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "                |     |"
  puts "           -----+-----+-----"
  puts "                |     |"
  puts "             #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "                |     |"
  puts ''
end
# rubocop:enable Metrics/AbcSize

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(board))}"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that is not a valid choice."
  end

  board[square] = PLAYER_MARKER
end

def computer_places_piece!(board)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, board, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, board, PLAYER_MARKER)
      break if square
    end
  end

  if !square && empty_squares(board).any?(5)
    square = 5
  end

  if !square
    square = empty_squares(board).sample
  end

  board[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select {|k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif board.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(array, delimiter=', ', conjuction='or')
  case array.size
  when 0..2 then array.join(" #{conjuction} ")
  else
    array[-1] = "#{conjuction} #{array.last}"
    array.join(delimiter)
  end
end

def detect_champion(player_score, computer_score)
  if player_score == 5
    return 'PLAYER'
  elsif computer_score == 5
    return 'COMPUTER'
  end
  nil
end

def alternate_player(player)
  case player
  when 'player' then 'computer'
  when 'computer' then 'player'
  end
end

def place_piece!(board, current_player)
  if current_player == 'player'
    player_places_piece!(board)
  elsif current_player == 'computer'
    computer_places_piece!(board)
  end
end

loop do
  player_score = 0
  computer_score = 0
  current_player = ''

  loop do
    system 'clear'
    prompt "Who should go first? (p) for player (c) for computer"
    turn = gets.chomp.downcase

    if turn.start_with?('p')
      current_player = 'player'
      break
    elsif turn.start_with?('c')
      current_player = 'computer'
      break
    else
      prompt "Sorry that is not a valid choice!"
    end
  end


  loop do
    board = intialize_board
    display_board(board, player_score, computer_score)

    loop do
      display_board(board, player_score, computer_score)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, player_score, computer_score)
    if someone_won?(board)
      case detect_winner(board)
      when 'Player' then player_score += 1
      when 'Computer' then computer_score += 1
      end
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    prompt "Push any key to continue..."
    gets
    display_board(board, player_score, computer_score)
    break if detect_champion(player_score, computer_score)
  end

  prompt "#{detect_champion(player_score, computer_score)} IS THE CHAMPION!!"
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing tic-tac-toe!"
