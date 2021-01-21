require 'pry'
class TicTacToe

    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize
        @board = Array.new(9, ' ')
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i-1
    end
    
    def move(input, token = "X")
        @board[input] = token
    end

    def position_taken?(input)
        self.board[input] != ' '
    end

    def valid_move?(input)
        self.board[input] && !position_taken?(input)
    end

    def turn
    
        loop do
            input = input_to_index(gets.chomp)
            if valid_move?(input)
                break
            end
        end 
        move(input, self.current_player)
        self.display_board
    end

    def turn_count
        self.board.select{|block| block != ' '}.count
    end

    def current_player
        if turn_count % 2 == 0
            "X"
        else
            "O"
        end
    end
end