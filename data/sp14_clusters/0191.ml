
let rec last l =
  match l with | x::[] -> x | hd::tl -> last tl | [] -> failwith "NO ELEMENT";;

let rec listReverse l =
  match l with
  | [] -> []
  | hd::tl -> let x = last l in if x > 0 then x :: x else x :: x;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l);;

*)

(* changed spans
(8,51)-(8,52)
listReverse
VarG

(8,63)-(8,64)
hd
VarG

*)
