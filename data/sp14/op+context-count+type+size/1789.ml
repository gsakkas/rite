
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x acc x = x ^ acc in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,16)-(6,31)
(6,20)-(6,31)
(6,24)-(6,25)
(6,28)-(6,31)
(7,17)-(7,18)
(7,22)-(7,58)
(7,30)-(7,31)
*)

(* type error slice
(3,2)-(7,58)
(3,2)-(7,58)
(4,10)-(4,12)
(6,6)-(7,58)
(6,6)-(7,58)
(6,12)-(6,31)
(6,14)-(6,31)
(6,16)-(6,31)
(7,6)-(7,58)
(7,22)-(7,58)
(7,35)-(7,49)
(7,35)-(7,58)
(7,50)-(7,51)
*)
