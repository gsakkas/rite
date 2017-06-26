
let rec sumList xs =
  match xs with | [] -> [] | head::tail -> head + (sumList tail);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

*)

(* changed spans
(3,24)-(3,26)
*)

(* type error slice
(2,3)-(3,66)
(2,16)-(3,64)
(3,2)-(3,64)
(3,24)-(3,26)
(3,43)-(3,64)
(3,50)-(3,64)
(3,51)-(3,58)
*)

(* all spans
(2,16)-(3,64)
(3,2)-(3,64)
(3,8)-(3,10)
(3,24)-(3,26)
(3,43)-(3,64)
(3,43)-(3,47)
(3,50)-(3,64)
(3,51)-(3,58)
(3,59)-(3,63)
*)
