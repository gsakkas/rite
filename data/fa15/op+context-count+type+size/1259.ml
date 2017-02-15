
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x x' = a ^ (x' ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,16)-(6,33)
(6,26)-(6,28)
*)

(* type error slice
(6,6)-(7,59)
(6,12)-(6,33)
(6,14)-(6,33)
(6,16)-(6,33)
(6,21)-(6,22)
(6,21)-(6,33)
(6,23)-(6,24)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
*)
