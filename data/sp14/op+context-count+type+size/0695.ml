
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = "" in
      let base = "" in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sepConcat sep t in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,21)
(7,7)-(7,61)
(7,18)-(7,20)
(7,24)-(7,61)
(7,32)-(7,34)
(7,38)-(7,52)
(7,38)-(7,61)
(7,53)-(7,54)
(7,55)-(7,59)
(7,60)-(7,61)
*)

(* type error slice
(7,24)-(7,61)
(7,32)-(7,34)
(7,38)-(7,52)
(7,38)-(7,61)
(7,60)-(7,61)
*)
