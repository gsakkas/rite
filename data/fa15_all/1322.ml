
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = "" in let l = h ^ (sep :: t) in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h ^ sep in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,18)-(7,20)
h ^ sep
AppG [VarG,VarG]

(7,32)-(7,46)
t
VarG

*)

(* type error slice
(7,32)-(7,46)
(7,34)-(7,35)
(7,36)-(7,46)
*)
