
let rec listReverse l =
  match l with | [] -> [] | x::y -> (listReverse y) :: x;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | x::y -> (listReverse y) @ [x];;

*)

(* changed spans
(3,37)-(3,57)
listReverse y @ [x]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,37)-(3,52)
(3,37)-(3,57)
(3,38)-(3,49)
*)
