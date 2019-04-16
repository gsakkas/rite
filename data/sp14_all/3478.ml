
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t; [h]);;

*)

(* changed spans
(2,59)-(2,76)
listReverse t; [h]
SeqG (AppG (fromList [EmptyG])) (ListG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(2,78)
(2,21)-(2,76)
(2,25)-(2,76)
(2,59)-(2,76)
(2,60)-(2,71)
(2,60)-(2,75)
*)
