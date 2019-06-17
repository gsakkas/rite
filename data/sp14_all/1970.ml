
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (List.rev x) ^ a in
      let base = sep in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = h ^ sep in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,19)-(6,31)
x
VarG

(7,18)-(7,21)
h ^ sep
AppG [VarG,VarG]

*)

(* type error slice
(6,19)-(6,31)
(6,19)-(6,35)
(6,20)-(6,28)
(6,32)-(6,33)
*)
