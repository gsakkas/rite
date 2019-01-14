
let rec listReverse l = match l with | [] -> [] | h::t -> [h; listReverse t];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(2,58)-(2,76)
h :: (listReverse t)
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG])]))) Nothing

*)
