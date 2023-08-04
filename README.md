# TableCraft
## Task

Your task is to develop a domain-specific language (DSL) for generating HTML tables.
The DSL should allow users to easily create HTML tables without the need for extensive knowledge of HTML syntax.

The DSL should support the following features:

Creating a table with a specified number of rows and columns
Setting the table's width and height
Specifying the table's border and cellpadding values
Adding headers to the table
Adding data to the table
Styling the table, headers, and data cells with CSS classes

To complete the task, you will need to write a Ruby module that defines the DSL and a set of tests to ensure that the DSL is working correctly. The DSL should be easy to use and read, with clear and concise syntax.

Note: You can use any Ruby libraries or frameworks you feel are necessary to complete the task. Please don't use chat gpt for code writing.
Deliver your code via any git repository.

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
 - Data source adapter for CSV and TSV files
 - Output adapter for STDOUT print and File exporting to the folder
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

  # input data format(possible is `csv` of `tsv`) and data table source file, without header row(only data)
  source "tsv", "input/data.tsv"

  # HTML template title tag naming page
  title "Import from Fixed Length Field File to the File"

  # Table width attribute
  width "100px"
  
  # Table height attribute
  height "100px"
  
  # Table border size
  border "2"
  
  # Table cellpadding attribute in pixels, without units
  cellpadding "4"

  # Set of table headers
  header ["#", "Column 1", "Column 2", "Column 3", "Column 4", "Column 5"]

  # Stylesheet for the table
  styles "input/styles_2.css"
  
  # Flag indicating about formatting document before output
  formatted true
  
  # Outputter type(possible is `print` and `file`) and destination file path 
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
