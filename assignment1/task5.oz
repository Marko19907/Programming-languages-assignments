
declare PI = 355.0 / 113.0

declare proc {Circle R} A D C in
   A = R * R * PI
   D = 2.0 * R
   C = D * PI

   {System.showInfo "Area: "#A}
   {System.showInfo "Diameter: "#D}
   {System.showInfo "Circumference: "#C}
end


{Circle 10}
