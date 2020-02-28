
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> [listReverse tl; hd];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) @ [hd];;

*)

(* changed spans
(3,39)-(3,59)
listReverse tl @ [hd]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,4)-(3,61)
(2,21)-(3,59)
(3,3)-(3,59)
(3,39)-(3,59)
(3,40)-(3,51)
(3,40)-(3,54)
*)
