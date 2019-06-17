
let rec last l =
  match l with | x::[] -> x | hd::tl -> last tl | [] -> failwith "NO ELEMENT";;

let rec listReverse l =
  match l with
  | [] -> []
  | hd::tl -> let x = last l in if x > 0 then x else x;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l);;

*)

(* changed spans
(8,15)-(8,55)
listReverse (hd :: l)
AppG [AppG [EmptyG,EmptyG]]

*)

(* type error slice
(6,3)-(8,55)
(7,11)-(7,13)
(8,15)-(8,55)
(8,33)-(8,55)
(8,36)-(8,37)
(8,36)-(8,41)
(8,40)-(8,41)
(8,54)-(8,55)
*)
