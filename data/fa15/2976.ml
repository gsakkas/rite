
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match x with | [] -> x | hea::tail -> a ^ (sep ^ hea) in
      let base = h in let l = [t] in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match x with | [] -> "" | hea::tail -> a ^ (sep ^ hea) in
      let base = h in let l = [t] in List.fold_left f base l;;

*)

(* changed spans
(6,39)-(6,40)
*)

(* type error slice
(6,18)-(6,71)
(6,24)-(6,25)
(6,39)-(6,40)
(6,56)-(6,71)
(6,58)-(6,59)
*)

(* all spans
(2,18)-(7,60)
(2,22)-(7,60)
(3,2)-(7,60)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,60)
(6,12)-(6,71)
(6,14)-(6,71)
(6,18)-(6,71)
(6,24)-(6,25)
(6,39)-(6,40)
(6,56)-(6,71)
(6,58)-(6,59)
(6,56)-(6,57)
(6,60)-(6,71)
(6,65)-(6,66)
(6,61)-(6,64)
(6,67)-(6,70)
(7,6)-(7,60)
(7,17)-(7,18)
(7,22)-(7,60)
(7,30)-(7,33)
(7,31)-(7,32)
(7,37)-(7,60)
(7,37)-(7,51)
(7,52)-(7,53)
(7,54)-(7,58)
(7,59)-(7,60)
*)
