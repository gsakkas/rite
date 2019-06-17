
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l) tl;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l);;

*)

(* changed spans
(3,39)-(3,63)
listReverse (hd :: l)
AppG [AppG [EmptyG,EmptyG]]

*)

(* type error slice
(2,4)-(3,65)
(2,21)-(3,63)
(3,3)-(3,63)
(3,39)-(3,50)
(3,39)-(3,63)
*)
