# Task 5

## Task 5 b)

_Give a high-level desciption of your solution and point out any limitations you find relevant_

```oz
declare fun {LazyNumberGenerator StartValue}
    StartValue | fun {$} {LazyNumberGenerator StartValue + 1} end
end

{System.show {LazyNumberGenerator 0}.1}                     % 0
{System.show {{LazyNumberGenerator 0}.2}.1}                 % 1
{System.show {{{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.2}.1} % 5
```

The function `LazyNumberGenerator` takes a start value and returns a lazy list of numbers starting from that value. The value is incremented by one each time the function is called and the result is a tuple containing the value and a function that returns the next value in the list.

For example, the expression `{LazyNumberGenerator 0}` returns the tuple `(0 {LazyNumberGenerator 1})` and we can fetch the first value by calling `.1` on the tuple and the second value by calling `.2` on the tuple and then `.1` on the result. Note that tuples are 1-indexed in Oz and Oz calls them pairs instead.

### Limitations

As for the limitations of the solution, the function `LazyNumberGenerator` is not tail recursive and therefore might not work for large numbers. I'm not sure what more limitations there could be with this solution.

