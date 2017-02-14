
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ h) in
      let base = "" in let l = sepConcat t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ h) in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,40)
(7,31)-(7,42)
*)

(* type error slice
(2,3)-(7,71)
(2,18)-(7,69)
(3,2)-(7,69)
(3,2)-(7,69)
(6,22)-(6,31)
(6,23)-(6,26)
(6,27)-(6,28)
(7,31)-(7,40)
(7,31)-(7,42)
(7,41)-(7,42)
*)
