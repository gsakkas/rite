
let rec listReverse l =
  match l with | [] -> [] | h::[] -> l | h::t -> (listReverse t) :: h;;
