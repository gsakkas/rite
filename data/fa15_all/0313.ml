
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sl ^ x) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,23)-(6,31)
x
VarG

*)

(* type error slice
(3,3)-(7,59)
(3,9)-(3,11)
(6,23)-(6,31)
(6,24)-(6,26)
(6,27)-(6,28)
*)
