
let rec listReverse l =
  match l with | [] -> [] | h::t -> let rev = listReverse t in [rev; h];;


(* fix

let rec helperAppend l n =
  match l with | [] -> n | h::t -> h :: (helperAppend t n);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> helperAppend (listReverse t) [h];;

*)

(* changed spans
(3,37)-(3,72)
helperAppend (listReverse t)
             [h]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(2,4)-(3,74)
(2,21)-(3,72)
(3,3)-(3,72)
(3,37)-(3,72)
(3,47)-(3,58)
(3,47)-(3,60)
(3,64)-(3,72)
(3,65)-(3,68)
*)
