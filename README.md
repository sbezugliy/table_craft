# TableCraft

## Description
HTML Table building DSL
 
Code challenge for embedd.it

Implemented:

 - DSL
 - HTML beautifier
 - CSS incapsulation and verification
 - Traversing of the `height`, `width`, `border`, `cellpadding` table tag attributes
 - Custom header column names
 - traversing of title tag for the HTML template   
 - Facade data source adapter for CSV and TSV files
 - Facade output adapter for STDOUT print and File exporting to the folder
 - Possible to generate multiple tables from one script using series of `build_table` scriptlets
 
Used gems:

  - zeitwerk for eager load application modules
  - phlex as HTML templating engine
  - htmlbeautifier as HTML output formatter
  - w3c_validators as CSS validator

## Dependencies

  > ruby -v "~>3.2.2"

## Installation

Install dependencies:

    $ bundle install

## Configuring

Table DSL script files are placed in the `*.tc` files (actually ruby file with *.tc extension) files are inside of the `./input` folder
This folder also contains stylesheets and input data tables in formats of the Comma Separated File and the Tabulation Separated File. 

### DSL directives

```ruby
# main closure of the single table build scriptlet
build_table do
  source "tsv", "input/data.tsv"

  title "Import from Fixed Length Field File to the File"

  
  width "100px"
  height "100px"
  border "2"
  cellpadding "4"

  header ["#", "Column 1", "Column 2", "Column 3", "Column 4", "Column 5"]

  styles "input/styles_2.css"
  
  formatted true
  output "file", "output/table_formatted.html"
end

```

## Usage

### Run

From root folder of the project run command:

```shell
  $ ./bin/build ./input/tables.tc
  
```

Result of the execution is print of the 'beautified' HTML for print outputter or HTML file inside of the ./output folder within encapsulated stylesheet.

### Linter

Integrated rubocop linter with `rubocop-shopify`, `rubocop-rake` extensions.

To run linting execute:

```shell
  $ bundle exec rubocop
```

### Tests

To run tests execute:

```shell
  $ rspec
```

## Author

Sergey Bezugliy <s.bezugliy@gmail.com>