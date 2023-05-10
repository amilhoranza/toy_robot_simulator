require_relative 'robot'

def execute_command(robot, command)
  case command
  when /^PLACE (\d),(\d),(NORTH|EAST|SOUTH|WEST)$/
    robot.place($1.to_i, $2.to_i, $3)
  when 'MOVE'
    robot.move if robot_placed?(robot)
  when 'LEFT'
    robot.left if robot_placed?(robot)
  when 'RIGHT'
    robot.right if robot_placed?(robot)
  when 'REPORT'
    puts robot.report if robot_placed?(robot)
  end
end

def robot_placed?(robot)
  !robot.report.nil?
end

robot = Robot.new

if ARGV.length == 1
  input_file = ARGV[0]
  File.open(input_file).each do |line|
    execute_command(robot, line.strip)
  end
else
  puts "Enter commands for the toy robot:"
  while command = gets.chomp
    break if command == 'EXIT'
    execute_command(robot, command)
  end
end
