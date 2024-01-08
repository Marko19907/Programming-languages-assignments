# Task 6

## Task 6 a)

_Is your `Sum` function from Task 2 tail recursive? If yes, explain why. If not, implement a tail-recursive version and explain which changes you needed to introduce to make it tail recursive._

```oz
declare fun {Sum List}
    case List of Head | Tail then
        Head + {Sum Tail}
    [] nil then
        0
    end
end
```

The function `Sum` is not tail recursive because the recursive call to `Sum` is not the last thing that happens in the function. The result of the recursive call is added to `Head` before the function returns. To make the function tail recursive, we need to introduce an accumulator that keeps track of the sum so far. The accumulator is passed as an argument to the function and the function returns the accumulator when the list is empty.

```oz
declare fun {Sum List Acc}
    case List of Head | Tail then
        {Sum Tail Head + Acc}
    [] nil then
        Acc
    end
end
```

Now the function is tail recursive because the recursive call to `Sum` is the last thing that happens in the function.


## Task 6 b)

_What is the benefit of tail recursion in Oz?_

The benefit of tail recursion in Oz is that it allows us to write recursive functions that can be executed with a constant amount of memory. This is because the recursive call is the last thing that happens in the function and therefore the function doesn't need to keep track of the previous calls on the stack. This is called tail call optimization and is a feature of many functional programming languages.

This will in other words, allow us to run the function on larger lists without the fear of running out of memory. 


## Task 6 c)

_Do all programming languages that allow recursion benefit from tail recursion? Why/why not?_

No, not all programming languages that allow recursion benefit from tail recursion. This is because tail call optimization is a feature of the compiler and not the language itself. The compiler needs to be able to detect tail calls and optimize them. For example, the C programming language allows recursion but does not benefit from tail recursion because the C compiler does not optimize tail calls. 

Rust for example, is a programming language that allows recursion and benefits from tail recursion sometimes. This is because the Rust compiler might choose to optimize tail calls. Java on the other hand, does not benefit from tail recursion because the VM it runs on does always preserves the stack and therefore does not optimize tail calls. Kotlin, a language that also runs on the JVM, on the other hand, does benefit from tail recursion because the Kotlin compiler optimizes tail calls to loops. 
