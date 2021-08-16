class TicTacToe
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
    WIN_COMBINATIONS = [
        [0, 1, 2], #top row
        [3, 4, 5], #middle row
        [6, 7, 8], #bottom row
        [0, 3, 6], #left column
        [1, 4, 7], #middle column
        [2, 5, 8], #right column
        [0, 4, 8], #left diagonal
        [2, 4, 6] #right diagonal
    ]
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "------------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "------------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def input_to_index(input)
        input.to_i - 1
    end
    def move(index, token)
        @board[index] = token
    end
    def position_taken?(index)
        if @board[index] == " "
            return false
        else
            return true
        end
    end
    def valid_move?(position)
        if position.between?(0,8) && position_taken?(position) == false
            return true
        else
            return false
        end
    end
    def turn_count
        @board.count {|place| place != " "}
    end
    def current_player
        turn_count.even? ? "X" : "O"
    end
    def turn
        puts "Enter number (1-9)"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
            token = current_player
            move(index, token)
        else
            turn
        end
        display_board
    end
    def won?
        WIN_COMBINATIONS.any? do |three_option|
            if position_taken?(three_option[0]) && @board[three_option[0]] == @board[three_option[1]] && @board[three_option[1]] == @board[three_option[2]]
                return three_option
            end
        end
    end
    def full?
        @board.all? {|position|
            position != " "
        }
    end
    def draw?
        full? && !won? 
    end
    def over?
        won? || draw?
    end
    def winner
        if winning = won?
            @board[winning[0]]
        end
    end
    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end