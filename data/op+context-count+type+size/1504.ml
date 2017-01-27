
let rec listReverse l =
  let a = [] in
  let rec get a = match a with | [] -> [] | x::xs -> [get xs; x] in get l;;


(* fix

let rec listReverse l =
  let rec getList a b = match a with | [] -> [] in getList [] l;;

*)

(* changed spans
(3,3)-(4,74)
(3,11)-(3,13)
(4,19)-(4,65)
(4,25)-(4,26)
(4,54)-(4,65)
(4,55)-(4,58)
(4,55)-(4,61)
(4,59)-(4,61)
(4,63)-(4,64)
(4,69)-(4,74)
*)

(* type error slice
(4,3)-(4,74)
(4,15)-(4,65)
(4,19)-(4,65)
(4,25)-(4,26)
(4,40)-(4,42)
(4,55)-(4,58)
(4,55)-(4,61)
(4,59)-(4,61)
*)
