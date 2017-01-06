
let join x l = x :: l;;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> join (listReverse tl) hd;;



let join x l = l :: x;;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> join (listReverse tl) hd;;


(* changed spans
(2,16)-(2,20)
*)

(* type error slice
(5,45)-(5,59)
*)
