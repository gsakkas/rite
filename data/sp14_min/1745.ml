
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t [h]];;


(* fix

let rec helperAppend l n =
  match l with | [] -> n | h::t -> h :: (helperAppend t n);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> helperAppend (listReverse t) [h];;

*)

(* changed spans
(2,59)-(2,78)
helperAppend (listReverse t)
             [h]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,4)-(2,80)
(2,21)-(2,78)
(2,25)-(2,78)
(2,59)-(2,78)
(2,60)-(2,71)
(2,60)-(2,77)
*)
