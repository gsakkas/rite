
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ t) in
      let base = "" in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,23)-(6,32)
sep
VarG

*)

(* type error slice
(3,3)-(7,60)
(6,23)-(6,32)
(6,28)-(6,29)
(6,30)-(6,31)
*)
