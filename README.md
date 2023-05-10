# Toy Robot Simulator

This application simulates a toy robot moving on a 5x5 square tabletop. It features both a command-line interface (CLI) and a web version using Sinatra.

## Installation

1. Clone this repository:
`git clone git@github.com:amilhoranza/toy_robot_simulator.git`

2. Change to the project directory:
`cd toy_robot_simulator`

3. Install the required gems:
`bundle install`

## Usage

### Command-line Interface (CLI)

1. Run the CLI application:
`ruby cli.rb input.txt` Or leave the second param blank and then you would see a prompt like `Enter commands for the toy robot:`


### Web Version

1. Start the web application:
`ruby web.rb`

2. Open your web browser and navigate to `http://localhost:4567`.

3. Enter commands in the input area, separated by newlines. Click "Execute" to run the commands.

## Running Tests

This application uses RSpec for testing. To run the tests, execute the following command in the project root directory:
`bundle exec rspec spec`
