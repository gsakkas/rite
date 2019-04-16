
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in let base = h in let l = t in List.fold_left f base;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,23)-(6,24)
sep ^ x
AppG (fromList [VarG])

(6,57)-(6,78)
List.fold_left f base l
AppG (fromList [VarG])

*)

(* type error slice
(3,3)-(6,78)
(4,11)-(4,13)
(6,7)-(6,78)
(6,28)-(6,78)
(6,44)-(6,78)
(6,57)-(6,71)
(6,57)-(6,78)
*)
