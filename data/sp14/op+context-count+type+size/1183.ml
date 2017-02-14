
let rec sumList xs = match xs with | [] -> [] | x::xs -> x + x;;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(2,21)-(2,62)
(2,43)-(2,45)
(2,57)-(2,58)
(2,61)-(2,62)
*)

(* type error slice
(2,21)-(2,62)
(2,21)-(2,62)
(2,43)-(2,45)
(2,57)-(2,62)
*)
