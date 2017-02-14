
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (h ^ sep) ^ t in
      let base = "" in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (h ^ sep) ^ x in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,30)-(6,31)
*)

(* type error slice
(3,2)-(7,59)
(3,2)-(7,59)
(6,18)-(6,31)
(6,28)-(6,29)
(6,30)-(6,31)
*)
