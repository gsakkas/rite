
let append x l =
  let rec helper x acc =
    match x with | [] -> acc | h::t -> helper t (h :: acc) in
  helper x l;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append listReverse t [h];;


(* fix

let append x l =
  let rec helper x acc =
    match x with | [] -> acc | h::t -> helper t (h :: acc) in
  helper x l;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

*)

(* changed spans
(8,37)-(8,61)
append (listReverse t) [h]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,4)-(5,15)
(2,12)-(5,13)
(2,14)-(5,13)
(3,3)-(5,13)
(4,5)-(4,59)
(4,26)-(4,29)
(4,40)-(4,46)
(4,40)-(4,59)
(4,47)-(4,48)
(4,49)-(4,59)
(4,55)-(4,58)
(5,3)-(5,9)
(5,3)-(5,13)
(5,10)-(5,11)
(7,4)-(8,63)
(7,21)-(8,61)
(8,37)-(8,43)
(8,37)-(8,61)
(8,44)-(8,55)
*)
