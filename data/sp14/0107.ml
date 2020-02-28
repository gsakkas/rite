
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (a ^ sep) x in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,30)
a ^ sep
AppG [VarG,VarG]

*)

(* type error slice
(6,19)-(6,28)
(6,19)-(6,30)
(6,22)-(6,23)
*)
