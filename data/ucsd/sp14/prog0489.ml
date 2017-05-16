
let rec sum (x,y) = match x with | [] -> 0 | h::t -> y = (y + (h sum (t, y)));;
