local X Y in
   X = "This is a string"
   thread {System.showInfo Y} end
   Y = X
end