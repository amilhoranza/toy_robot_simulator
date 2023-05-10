# spec/robot_spec.rb
require_relative '../robot'
require 'rspec'

RSpec.describe Robot do
  let(:robot) { Robot.new }

  describe '#place' do
    it 'places the robot at a valid position' do
      robot.place(0, 0, 'NORTH')
      expect(robot.report).to eq('0,0,NORTH')
    end

    it 'does not place the robot at an invalid position' do
      robot.place(-1, 0, 'NORTH')
      expect(robot.report).to eq ',,'
    end
  end

  describe '#move' do
    it 'moves the robot one position forward in its current direction' do
      robot.place(1, 2, 'EAST')
      robot.move
      expect(robot.report).to eq('2,2,EAST')
    end

    it 'does not move the robot off the table' do
      robot.place(0, 0, 'SOUTH')
      robot.move
      expect(robot.report).to eq('0,1,SOUTH')
    end
  end

  describe '#left' do
    it 'rotates the robot 90 degrees left' do
      robot.place(0, 0, 'NORTH')
      robot.left
      expect(robot.report).to eq('0,0,WEST')
    end
  end

  describe '#right' do
    it 'rotates the robot 90 degrees right' do
      robot.place(0, 0, 'NORTH')
      robot.right
      expect(robot.report).to eq('0,0,EAST')
    end
  end

  describe 'integration' do
    it 'correctly processes a series of commands' do
      robot.place(1, 2, 'EAST')
      robot.move
      robot.move
      robot.right
      robot.move
      expect(robot.report).to eq('3,3,SOUTH')
    end
  end
end
