# TableCraft

HTML Table geration DSL 
Code challenge for embedd.it

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle install

## Configuring

Table config files are placed in the `*.tc` (actually ruby file with *.dat extension) files at `./input` folder

## Usage

Run from root folder in the shell terminal:

```shell
  $ ./bin/build ./input/tables.tc
  
```

Outputs HTML to the shell `STDOUT` or to a `.html` file 

## Author

Sergey Bezugliy <s.bezugliy@gmail.com>