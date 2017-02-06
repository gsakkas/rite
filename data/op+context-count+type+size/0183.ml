
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h "to be implemented" in
      let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,18)-(7,39)
(7,20)-(7,39)
*)

(* type error slice
(2,4)-(8,45)
(2,19)-(8,43)
(2,23)-(8,43)
(3,3)-(8,43)
(3,3)-(8,43)
(3,3)-(8,43)
(3,3)-(8,43)
(3,9)-(3,11)
(6,7)-(8,43)
(6,13)-(6,31)
(6,15)-(6,31)
(6,19)-(6,20)
(6,24)-(6,27)
(6,30)-(6,31)
(7,7)-(8,43)
(7,18)-(7,19)
(7,18)-(7,39)
(8,7)-(8,43)
(8,15)-(8,16)
(8,20)-(8,34)
(8,20)-(8,43)
(8,20)-(8,43)
(8,35)-(8,36)
(8,37)-(8,41)
(8,42)-(8,43)
*)
