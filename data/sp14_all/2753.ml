
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length ()) = 0 then a ^ x else a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) = 0 then a ^ x else a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,35)-(6,37)
sl
VarG

*)

(* type error slice
(6,22)-(6,38)
(6,23)-(6,34)
(6,35)-(6,37)
*)
