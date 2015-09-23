# ErbSpec

Helpers for testing ERB template files in isolation from the application.

## Usage

`require 'erb_spec'`

Create a stubbed template renderer with `erb_stub = ErbSpec::ErbStub.new('path/to/template.erb')`

Use standard RSpec expects/allows to set any values/functions you care about on the templates context.

Call `erb_stub.render` to produce a simple Capybara Node object. This allows standard Capybara matchers to be used to assert properties of the html.

Call `erb_stub.render_html` to produce a string representation of the rendered template.

### Debugging
Passing true to either of the render methods will print the rendered HTML to stdout.

Passing true as the second parameter of the initializer will cause any unstubbed functions to be printed to stdout. 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/peterjroberts/erb_spec.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
