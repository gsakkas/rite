
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) = 2 then a ^ x in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) < 2 then a ^ x else a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,22)-(6,41)
List.length t < 2
BopG (AppG [EmptyG]) LitG

(6,52)-(6,52)
a ^ (x ^ sep)
AppG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(6,19)-(6,52)
(6,47)-(6,52)
(6,49)-(6,50)
(6,52)-(6,52)
*)
