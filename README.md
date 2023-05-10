# Toy Robot Simulator

## How it works:

* [CLI version](./README.md#command-line-interface-(CLI))
* [Web version](./README.md#web)

## Command Line Interface (CLI)
To provide input from a file, run the CLI application as follows:
ruby cli.rb input.txt

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```
Or leave the second param blank and then you would see a prompt like
```
Enter commands for the toy robot:
```

### WEB

You can run the web application version using `ruby web.rb` and access it at http://localhost:4567. 
Just add the commands in the input field and click on the "Execute" button. 
The current robot position and direction will be displayed when the "REPORT" command is entered.