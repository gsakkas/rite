
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
(6,31)-(6,32)
*)

(* type error slice
(3,3)-(7,60)
(6,20)-(6,21)
(6,20)-(6,27)
(6,20)-(6,32)
(6,22)-(6,23)
(6,24)-(6,27)
(6,29)-(6,30)
(6,31)-(6,32)
*)
