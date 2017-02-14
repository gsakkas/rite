
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match x with | [] -> a | hd::tl -> a ^ (sep ^ hd) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,67)
(6,39)-(6,40)
(6,53)-(6,54)
(6,53)-(6,67)
(6,55)-(6,56)
(6,57)-(6,67)
(6,58)-(6,61)
(6,62)-(6,63)
(6,64)-(6,66)
(7,6)-(7,58)
*)

(* type error slice
(3,2)-(7,58)
(3,2)-(7,58)
(6,6)-(7,58)
(6,12)-(6,67)
(6,14)-(6,67)
(6,18)-(6,67)
(6,18)-(6,67)
(6,24)-(6,25)
(6,53)-(6,54)
(6,53)-(6,67)
(6,55)-(6,56)
(7,6)-(7,58)
(7,17)-(7,18)
(7,22)-(7,58)
(7,30)-(7,31)
(7,35)-(7,49)
(7,35)-(7,58)
(7,50)-(7,51)
(7,52)-(7,56)
(7,57)-(7,58)
*)
