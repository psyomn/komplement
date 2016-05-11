# komplement

It's a dumb sanity check tool for your html. The idea is that if you create your
custom elements (for example, look at knockout.js components), and you want to
make sure that nothing goes awry while maintaining your source, you can run this
easilly configurable tool to do it for you.

* [Homepage](https://github.com/psyomn/komplement#readme)
* [Issues](https://github.com/psyomn/komplement/issues)
* [Documentation](http://rubydoc.info/gems/komplement/frames)
* [Email](mailto:lethaljellybean at gmail.com)

[![Build Status](https://secure.travis-ci.org/psyomn/komplement.svg?branch=master)](https://travis-ci.org/psyomn/komplement)

## Features
## Examples

If you want to do things by hand:

```ruby
    require 'komplement'

    Komplement
      .new
      .with_ignored(%w[a br div])
      .with_ignored(%w[custom-element potato])
      .in_filetypes(%w[rb erb.html html])
      .in_dirs(%w[./app ./some-other-place])
      .run
```

A constant to get rid of most manual workings is provided for you if you want to
use it:

```ruby
    require 'komplement'

    Komplement
      .new
      .with_ignored(Komplement::HTML_ELEMENTS)
      .with_ignored(%w[custom-element potato])
      .in_filetypes(%w[rb erb.html html])
      .in_dirs(%w[./app ./some-other-place])
      .run
```
## Install

    $ gem install komplement

## Synopsis

    $ komplement

## Copyright

Copyright (c) 2016 Simon (psyomn) Symeonidis

See LICENSE.txt for details.
