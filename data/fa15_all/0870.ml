
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a @ x in
      let base = h in let l = sep in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,20)-(6,21)
(^)
VarG

(6,22)-(6,23)
sep
VarG

(6,22)-(6,23)
(^)
VarG

(6,22)-(6,23)
sep ^ x
AppG (fromList [VarG])

(7,30)-(7,33)
t
VarG

*)
