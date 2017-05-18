
let rec sum (x,y) =
  match x with | [] -> y = (y + 0) | h::t -> y = (y + (h sum (t, y)));;
