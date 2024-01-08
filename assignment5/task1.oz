
% Task 1 a)

% Execute the following code in Mozart and observe the results. What sequence of numbers gets printed
% as output of the Oz environment?

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



% Task 1 c)

% Execute the following code in Mozart and observe the results. What sequence of numbers gets printed
% as output of the Oz environment?

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


% Possible output:
% 2
% 20
% 22
