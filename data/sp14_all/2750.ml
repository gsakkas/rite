
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if List.length < 2 then a ^ x in
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
(6,22)-(6,33)
List.length t
AppG [VarG]

(6,48)-(6,48)
a ^ (x ^ sep)
AppG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(6,19)-(6,48)
(6,22)-(6,33)
(6,22)-(6,37)
(6,36)-(6,37)
(6,43)-(6,48)
(6,45)-(6,46)
(6,48)-(6,48)
*)
