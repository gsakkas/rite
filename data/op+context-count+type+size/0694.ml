
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = "" in
      let base = sepConcat sep [] in let l = "" in List.fold_left f base l;;


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
(7,7)-(7,75)
(7,32)-(7,34)
(7,46)-(7,48)
*)

(* type error slice
(6,7)-(7,75)
(6,13)-(6,21)
(6,15)-(6,21)
(6,19)-(6,21)
(7,7)-(7,75)
(7,38)-(7,75)
(7,46)-(7,48)
(7,52)-(7,66)
(7,52)-(7,75)
(7,67)-(7,68)
(7,69)-(7,73)
(7,74)-(7,75)
*)
