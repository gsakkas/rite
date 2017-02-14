
let rec sumList xs = match xs with | [] -> [] | x::xs -> x + x;;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(2,22)-(2,63)
(2,44)-(2,46)
(2,58)-(2,59)
(2,62)-(2,63)
*)

(* type error slice
(2,22)-(2,63)
(2,22)-(2,63)
(2,44)-(2,46)
(2,58)-(2,63)
*)
