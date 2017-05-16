
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) h;;

let _ = listReverse ["a"; "b"; "c"; "d"];;
