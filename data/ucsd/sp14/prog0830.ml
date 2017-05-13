
let rec sum (x,y) = match x with | [] -> y | h::t -> y = (y + (h sum (t, y)));;
