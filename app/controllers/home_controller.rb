class HomeController < ApplicationController

	def index
    @board = Board.new
	end
end
