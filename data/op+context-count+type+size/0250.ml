
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
(7,30)-(7,41)
*)

(* type error slice
(6,7)-(7,68)
(6,13)-(6,22)
(6,15)-(6,22)
(6,19)-(6,20)
(6,19)-(6,22)
(6,21)-(6,22)
(7,7)-(7,68)
(7,18)-(7,20)
(7,24)-(7,68)
(7,30)-(7,41)
(7,34)-(7,35)
(7,34)-(7,41)
(7,36)-(7,37)
(7,38)-(7,41)
(7,45)-(7,59)
(7,45)-(7,68)
(7,60)-(7,61)
(7,62)-(7,66)
(7,67)-(7,68)
*)
