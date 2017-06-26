
let rec sumList xs = match xs with | [] -> [] | _ -> (List.hd xs) + 2;;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(2,21)-(2,69)
(2,43)-(2,45)
(2,68)-(2,69)
*)

(* type error slice
(2,21)-(2,69)
(2,43)-(2,45)
(2,53)-(2,69)
*)

(* all spans
(2,16)-(2,69)
(2,21)-(2,69)
(2,27)-(2,29)
(2,43)-(2,45)
(2,53)-(2,69)
(2,53)-(2,65)
(2,54)-(2,61)
(2,62)-(2,64)
(2,68)-(2,69)
*)
