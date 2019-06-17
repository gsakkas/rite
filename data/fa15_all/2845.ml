
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (List.map l);;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat " " l;;

*)

(* changed spans
(9,24)-(9,46)
sepConcat " " l
AppG [LitG,VarG]

*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(6,23)-(6,32)
(6,24)-(6,27)
(6,28)-(6,29)
(9,24)-(9,33)
(9,24)-(9,46)
(9,34)-(9,46)
(9,35)-(9,43)
*)
