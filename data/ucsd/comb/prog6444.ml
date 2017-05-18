
let rec listReverse l =
  match l with | [] -> 0 | h::t -> (listReverse t) @ [h];;
