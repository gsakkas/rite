
let rec sum (x,y) =
  match x with | [] -> [] | h::t -> y = (y + (h sum (t, y)));;
