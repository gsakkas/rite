
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in let base = t in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h in let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,35)-(6,36)
""
LitG

*)

(* type error slice
(3,3)-(6,76)
(6,7)-(6,76)
(6,13)-(6,20)
(6,15)-(6,20)
(6,19)-(6,20)
(6,24)-(6,76)
(6,35)-(6,36)
(6,53)-(6,67)
(6,53)-(6,76)
(6,68)-(6,69)
(6,70)-(6,74)
*)
