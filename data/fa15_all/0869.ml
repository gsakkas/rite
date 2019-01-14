
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
(6,22)-(6,23)
sep
VarG

(6,22)-(6,23)
(^)
VarG

(6,22)-(6,23)
sep ^ x
AppG (fromList [VarG])

(6,56)-(6,77)
List.fold_left f base l
AppG (fromList [VarG])

*)
