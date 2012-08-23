# EnumerableDeepSearch

Recursively searches enumerable objects and their nested objects for a given object or string.

## Installation

Add this line to your application's Gemfile:

    gem 'enumerable_deep_search'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enumerable_deep_search

## Usage

In practice it's an exploration tool, I recommend using it with pry and extending objects as needed.
You can also include it on a class and use it the same way on instances.

example:

```ruby
object.extend EnumerableDeepSearch
object.search 'something'
```

It will return a facimile of the path to the matching object, for hash-like objects it will return a Hash containg the match as well as the opposite pair (either the key or the value), for array-like objects it will return a two element Array where the first element is the index of the match and second element the match itself.

example:

```ruby
object.search 'something'
#=> {:foo => [1, 'something']}
```

## Ideas? Complaints?

- You could Contribute: https://github.com/acook/enumerable_deep_search/fork
- Or you could Submit an issue: https://github.com/acook/enumerable_deep_search/issues
- Or you could even ping me on Twitter: http://twitter.com/anthony_m_cook

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
