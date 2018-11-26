
let rec listReverse l =
  match l with | [] -> [] | x::l -> x :: (listReverse l x);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | x::l -> x :: (listReverse l);;

*)

(* changed spans
(3,41)-(3,58)
listReverse l
AppG (fromList [VarG])

*)
