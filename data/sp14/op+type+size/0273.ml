
let rec sumList xs =
  match xs with | [] -> 0 | x::xs -> (List.fold_left x) + xs;;


(* fix

let rec sumList xs = match xs with | [] -> 0;;

*)

(* changed spans
(3,2)-(3,60)
(3,37)-(3,60)
*)

(* type error slice
(3,37)-(3,55)
(3,37)-(3,60)
(3,38)-(3,52)
*)

(* all spans
(2,16)-(3,60)
(3,2)-(3,60)
(3,8)-(3,10)
(3,24)-(3,25)
(3,37)-(3,60)
(3,37)-(3,55)
(3,38)-(3,52)
(3,53)-(3,54)
(3,58)-(3,60)
*)
