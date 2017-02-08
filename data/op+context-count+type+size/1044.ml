
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ (a t)) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,31)-(6,34)
(6,33)-(6,34)
*)

(* type error slice
(6,7)-(7,59)
(6,13)-(6,34)
(6,15)-(6,34)
(6,19)-(6,34)
(6,21)-(6,22)
(6,31)-(6,32)
(6,31)-(6,34)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
*)
