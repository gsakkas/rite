
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ t) in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,30)-(6,31)
*)

(* type error slice
(3,3)-(7,61)
(3,3)-(7,61)
(6,24)-(6,31)
(6,28)-(6,29)
(6,30)-(6,31)
*)
