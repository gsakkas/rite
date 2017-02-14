
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sl in
      let l = failwith "to be implemented" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,17)-(7,19)
(8,6)-(8,69)
(8,14)-(8,22)
(8,14)-(8,42)
(8,23)-(8,42)
(8,46)-(8,69)
*)

(* type error slice
(3,2)-(8,69)
(3,2)-(8,69)
(3,2)-(8,69)
(3,2)-(8,69)
(3,8)-(3,10)
(6,6)-(8,69)
(6,12)-(6,23)
(6,18)-(6,23)
(6,20)-(6,21)
(6,22)-(6,23)
(7,6)-(8,69)
(7,17)-(7,19)
(8,46)-(8,60)
(8,46)-(8,69)
(8,61)-(8,62)
(8,63)-(8,67)
*)
