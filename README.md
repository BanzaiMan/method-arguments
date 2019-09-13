# method-arguments
Obtain arguments passed to the current Ruby method and their values in a single call

This is most likely to be useful when logging debugging information.

## Usage

```ruby
require '__arguments__'

class Foo
  include Arguments

  def method1(required_arg, optional_arg="optional", required_kw_arg:, optional_kw_arg: "optional_kw")
    __arguments__(binding)
  end
end

Foo.new.method1("foo", "opt2", required_kw_arg: "required") # => [[:required_arg, "foo"], [:optional_arg, "opt2"], [:required_kw_arg, "required"], [:optional_kw_arg, "optional_kw"]]
```
