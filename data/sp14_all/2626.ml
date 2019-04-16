
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (x ^ sep) ^ a in
      let base = "" in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (x ^ sep) ^ a in
      let base = "" in let l = [] in List.fold_left f base l;;

*)

(* changed spans
(7,32)-(7,34)
[]
ListG (fromList [])

*)

(* type error slice
(7,24)-(7,61)
(7,32)-(7,34)
(7,38)-(7,52)
(7,38)-(7,61)
(7,60)-(7,61)
*)
