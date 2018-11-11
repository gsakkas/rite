
let pipe fs =
  let f a x = function | f' -> x (f' a) in
  let base = function | y -> y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | v -> x (a v) in
  let base = function | y -> y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,39)
match $x with
| v -> x (a v)
CaseG VarG [(Nothing,AppG [EmptyG])]

(4,2)-(4,58)
v
VarG

*)
