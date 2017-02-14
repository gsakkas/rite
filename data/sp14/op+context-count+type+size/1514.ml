
let rec listReverse l =
  let a = [] in
  let rec get a = match a with | [] -> [] | x::xs -> [get xs; x] in get l;;


(* fix

let rec listReverse l =
  let rec getList a b = match a with | [] -> [] in getList [] l;;

*)

(* changed spans
(3,2)-(4,73)
(3,10)-(3,12)
(4,2)-(4,73)
(4,18)-(4,64)
(4,24)-(4,25)
(4,53)-(4,64)
(4,54)-(4,57)
(4,54)-(4,60)
(4,58)-(4,60)
(4,62)-(4,63)
(4,68)-(4,73)
*)

(* type error slice
(4,2)-(4,73)
(4,14)-(4,64)
(4,18)-(4,64)
(4,53)-(4,64)
(4,53)-(4,64)
(4,54)-(4,57)
(4,54)-(4,60)
*)
