
# A modified version of the code from http://steamcode.blogspot.com.tr/2010/06/n-queens-problem-in-ruby.html.
# Modified to work with a randomly located queen at start.

class Problem
  def initialize(n=8)
      @n = n
      @board = Array.new(n)
      @board.map! { Array.new(n, "*") }
  end

  def print_board
    puts "Board:"
    @board.each_index do |row|
      @board.each_index do |col|
        print "#{@board[row][col]}"
      end
      puts
    end
  end



  def control(row_main,col_main)
    return false if !control_row(row_main)
    return false if !control_col(col_main)

    return false if !contol_diag(row_main,col_main,1,1)
    return false if !contol_diag(row_main,col_main,1,-1)
    return false if !contol_diag(row_main,col_main,-1,1)
    return false if !contol_diag(row_main,col_main,-1,-1)

    return true
  end

  def control_row(row_main)
    0.upto(@n-1) do |col|
      return false if @board[row_main][col]=="Q"
    end
    return true
  end

  def control_col(col_main)
    0.upto(@n-1) do |row|
      return false if @board[row][col_main]=="Q"
    end
    return true
  end

  def contol_diag(row_main,col_main,row_mod,col_mod)
    row,col=row_main+row_mod,col_main+col_mod
    while true do
      break if (row >= @n) || (col >= @n) || (row < 0) || (col < 0)

      return false if @board[row][col]=="Q"

      row,col= row+row_mod,col+col_mod
    end
    return true
  end

  def start
    row_start=rand(0...8)
    col_start=rand(0...8)
    @board[0][0]="Q"
    print_board
    solve
  end

  def solve
    0.upto(@n-1) do |row|
       0.upto(@n-1) do |col|
         if control(row,col)
           @board[row][col]="Q"
         end
       end
    end
    print_board
  end

end



problem = Problem.new.start