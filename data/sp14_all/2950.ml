
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x acc x = x ^ acc in
      let base = "" in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,17)-(6,32)
a ^ x
AppG (fromList [VarG])

*)

(* type error slice
(6,7)-(7,60)
(6,13)-(6,32)
(6,15)-(6,32)
(6,17)-(6,32)
(7,7)-(7,60)
(7,18)-(7,20)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
(7,54)-(7,58)
*)
