
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
x ^ a
AppG (fromList [VarG])

(7,32)-(7,34)
t
VarG

(7,46)-(7,48)
t
VarG

*)

(* type error slice
(7,38)-(7,75)
(7,46)-(7,48)
(7,52)-(7,66)
(7,52)-(7,75)
(7,74)-(7,75)
*)
