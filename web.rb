require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'robot'

get '/' do
  erb :index
end

post '/execute' do
  commands = params[:commands].split(/\r?\n/)
  robot = Robot.new

  commands.each do |command|
    case command
    when /^PLACE (\d),(\d),(NORTH|EAST|SOUTH|WEST)$/
      robot.place($1.to_i, $2.to_i, $3)
    when 'MOVE'
      robot.move
    when 'LEFT'
      robot.left
    when 'RIGHT'
      robot.right
    when 'REPORT'
      @report = robot.report
    end
  end

  @board = Array.new(5) { Array.new(5, '') }
  if @report
    x, y, direction = @report.split(',')
    @board[y.to_i][x.to_i] = 'ROBOT'
  end

  erb :result
end
