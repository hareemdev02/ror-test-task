module BoardHelper
  def top_ten_minesweeper_boards
    Board.ten_recent_boards
  end

  def parsed_board_data
    JSON.parse(@board.board_data)
  end

  def cell(cell_value)
    if cell_value == 1
      "<div class='cell mine'> <i class='fas fa-bomb'></i></div>".html_safe
    else
      "<div class='cell'><i class='far fa-square'></i></div>".html_safe
    end
  end
end
