
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sepConcat sep t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,30)-(7,39)
(7,30)-(7,45)
(7,40)-(7,43)
*)

(* type error slice
(2,3)-(7,74)
(2,18)-(7,72)
(2,22)-(7,72)
(3,2)-(7,72)
(4,10)-(4,12)
(7,22)-(7,72)
(7,30)-(7,39)
(7,30)-(7,45)
(7,49)-(7,63)
(7,49)-(7,72)
(7,71)-(7,72)
*)
