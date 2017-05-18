
let rec listReverse (l : int list) =
  (match l with | [] -> [] | h::t -> (listReverse t) @ h : int list);;
