class MineSweeperBoard

  MINE = 1
  EMPTY_CELL = 0

  attr_reader :height, :width, :num_of_mines
  attr_accessor :params

  def initialize(params)
    self.params = params
    @height = params[:height].to_i
    @width = params[:width].to_i
    @num_of_mines = params[:num_mines].to_i
  end

  def call
    @board = Board.new(params)
    @board.board_data = board_data_with_mines
    @board.save!
    @board
  end

  private

  def board_data_with_mines
    board = Array.new(height) { Array.new(width, EMPTY_CELL) }
    positions = (0...height).to_a.product((0...width).to_a)
    positions.shuffle!
    positions.take(num_of_mines).each { |x, y| board[x][y] = MINE }
    board
  end
end