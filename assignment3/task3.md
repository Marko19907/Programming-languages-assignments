# Task 3

## Task 3 b)

_Explain each line of code in RightFold in your own words_

```oz
/*
RightFold takes a list and two procedures as arguments. The first procedure is an anonymous procedure that takes two arguments and returns the first argument. The second is used to fold the list (accumulate the result of the first procedure). The result of RightFold is the result of applying the first procedure to the head of the list and the result of the second procedure applied to the tail of the list. This is done recursively until the list is empty.

For example if we're calling it with the list [1 2 3] and the sum procedure then the result would be 1 + (2 + (3 + 0)) = 6.
*/
declare fun {RightFold List Op U}
    case List of Head | Tail then       % If List is not empty then put out the head of the list and then
        {Op Head {RightFold Tail Op U}} % Apply Op to Head and the result of RightFold Tail Op U
    [] _ then                           % If List is empty then
        U                               % Return U     
    end
end
```


## Task 3 d)

_For the `Sum` and `Lenght` operations, would `LeftFold` (a left-associative fold) and `RightFold` give different results? Can you provide an example of an operation for which the two folds do not produce the same result?_

Yes, they would give different results. For example if we're doing a subtraction operation then the result of LeftFold would be 1 - (2 - (3 - 0)) = 2 while the result of RightFold would be (1 - 2) - 3 = -4.


## Task 3 e)

_What is an appropriate value for `U` when using `RightFold` to implement the product of list elements?_

The appropriate value for U would be 1 since 1 is the neutral element of multiplication.
