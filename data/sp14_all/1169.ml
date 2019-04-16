
let rec listReverse l = match l with | [] -> [] | a::b -> listReverse [a] b;;


(* fix

let rec listReverse l = match l with | [] -> [] | a::b -> listReverse [a];;

*)

(* changed spans
(2,59)-(2,76)
listReverse [a]
AppG (fromList [ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(2,78)
(2,21)-(2,76)
(2,25)-(2,76)
(2,59)-(2,70)
(2,59)-(2,76)
*)
