
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x x' = a ^ (x' ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,17)-(6,34)
a ^ (sep ^ x)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(6,7)-(7,60)
(6,13)-(6,34)
(6,15)-(6,34)
(6,17)-(6,34)
(6,22)-(6,23)
(6,22)-(6,34)
(6,24)-(6,25)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
*)
