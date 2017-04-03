
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = "" in let l x = x ^ sep in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = "" in
      let l = [(fun x  -> x ^ sep)] in List.fold_left f base l;;

*)

(* changed spans
(7,29)-(7,40)
*)

(* type error slice
(7,23)-(7,67)
(7,29)-(7,40)
(7,44)-(7,58)
(7,44)-(7,67)
(7,66)-(7,67)
*)

(* all spans
(2,18)-(7,67)
(2,22)-(7,67)
(3,2)-(7,67)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,67)
(6,12)-(6,21)
(6,14)-(6,21)
(6,18)-(6,21)
(6,18)-(6,19)
(6,20)-(6,21)
(7,6)-(7,67)
(7,17)-(7,19)
(7,23)-(7,67)
(7,29)-(7,40)
(7,33)-(7,40)
(7,35)-(7,36)
(7,33)-(7,34)
(7,37)-(7,40)
(7,44)-(7,67)
(7,44)-(7,58)
(7,59)-(7,60)
(7,61)-(7,65)
(7,66)-(7,67)
*)
