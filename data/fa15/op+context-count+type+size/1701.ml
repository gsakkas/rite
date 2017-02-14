
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match x with | [] -> x | hd::tl -> a ^ (sep ^ hd) in
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
(6,18)-(6,67)
(6,18)-(6,67)
(6,18)-(6,67)
(6,18)-(6,67)
(6,24)-(6,25)
(6,39)-(6,40)
(6,53)-(6,67)
(6,55)-(6,56)
*)
