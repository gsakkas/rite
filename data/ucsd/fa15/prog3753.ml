
let rec helper a x =
  match x with | [] -> 0 | h::t -> (h * h) + (helper (a, x));;
