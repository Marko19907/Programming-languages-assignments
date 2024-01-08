# Task 1

## Task 1 b)

_Explain with your own words how execution proceeds and why the result is as such. Would it be possible to have a different sequence printed as output? Explain your answer._

```oz
local A=10 B=20 C=30 in
    {System.show C}

    thread
        {System.show A}
        {Delay 100}
        {System.show A * 10}
    end
    
    thread
        {System.show B}
        {Delay 100}
        {System.show B * 10}
    end

    {System.show C * 100}
end


% Possible output:
% 30
% 3000
% 10
% 20
% 200
% 100
```

The execution proceeds as follows:
* The main thread is started and prints `30`.
* Two threads are started.
* The main thread prints `3000`.
* The two threads print `10` and `20` respectively.
* The two threads then print `200` and `100` respectively after a delay of 100ms.

The result is as such because the main thread is started first, and the two other threads are started afterwards. The main thread is not blocked by the two other threads, so it continues to execute and prints `3000` before the two other threads have a chance to print anything.

It would be possible to have a different sequence printed as output since the threads they are running concurrently and their execution is not synchronized. So it’s fully possible that one thread could print its second value before the other, depending on how the Oz scheduler decides to interleave their execution. For example, depending on when the other two threads are started, one of them could print `100` before the other prints `200`. 



## Task 1 d)

_Explain with your own words how execution proceeds and why the result is as such. Would it be possible
to have a different sequence printed as output? Explain your answer._

```oz
local A B C in
    thread
        A = 2
        {System.show A}
    end

    thread
        B = A * 10
        {System.show B}
    end

    C = A + B
    {System.show C}
end


% Output:
% 2
% 20
% 22
```

The execution proceeds as follows:
* The main thread is started and starts two threads.
* The two threads print `2` and `20` respectively.
* The main thread prints `22`.

The result is as such because the two threads are started at the same time, and the main thread is blocked until both threads have finished because it needs the values of `A` and `B` to calculate `C`. This is a feature of Oz called _dataflow_.

It would not be possible to have a different sequence printed as output. The two threads are started at the same time, and the main thread is blocked until both threads have finished. This means that the two threads will always print `2` and `20` respectively before the main thread prints `22`.
