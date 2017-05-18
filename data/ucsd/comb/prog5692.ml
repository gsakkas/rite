
let rec listReverse l =
  (match l with | [] -> [] | h::t -> (listReverse t) @ h : int list);;

let _ = listReverse ["a"; "b"; "c"; "d"];;
