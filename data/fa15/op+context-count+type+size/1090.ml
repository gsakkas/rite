
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ (sepConcat sep t)) in
      let base = t in
      let l = failwith "to be implemented" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = sep in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,19)
(6,29)-(6,46)
(6,30)-(6,39)
(6,40)-(6,43)
(6,44)-(6,45)
(7,17)-(7,18)
(8,6)-(8,69)
(8,14)-(8,22)
(8,14)-(8,42)
(8,23)-(8,42)
*)

(* type error slice
(3,2)-(8,69)
(3,2)-(8,69)
(6,6)-(8,69)
(6,12)-(6,47)
(6,14)-(6,47)
(6,18)-(6,47)
(6,20)-(6,21)
(7,6)-(8,69)
(7,17)-(7,18)
(8,46)-(8,60)
(8,46)-(8,69)
(8,61)-(8,62)
(8,63)-(8,67)
*)
