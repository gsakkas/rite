
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in
      let base = "" in let l = h ^ t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,32)-(7,37)
t
VarG

*)

(* type error slice
(3,3)-(7,64)
(7,32)-(7,37)
(7,34)-(7,35)
(7,36)-(7,37)
*)
