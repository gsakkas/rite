
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (sepConcat h) ^ (sep t) in
      let base = "" in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,31)
(6,19)-(6,28)
(6,34)-(6,41)
(6,39)-(6,40)
*)

(* type error slice
(2,3)-(7,61)
(2,18)-(7,59)
(3,2)-(7,59)
(3,2)-(7,59)
(6,18)-(6,31)
(6,19)-(6,28)
(6,29)-(6,30)
(6,34)-(6,41)
(6,35)-(6,38)
(6,39)-(6,40)
*)
