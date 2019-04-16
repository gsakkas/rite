
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse l);;

*)

(* changed spans
(2,59)-(2,77)
h :: (listReverse l)
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(2,4)-(2,79)
(2,21)-(2,77)
(2,25)-(2,77)
(2,59)-(2,77)
(2,60)-(2,71)
(2,60)-(2,73)
*)
