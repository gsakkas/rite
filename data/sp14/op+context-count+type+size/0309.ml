
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ sep in
      let base = h ^ sep in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,22)-(6,25)
(7,6)-(7,64)
(7,17)-(7,18)
(7,28)-(7,64)
(7,36)-(7,37)
(7,41)-(7,64)
*)

(* type error slice
(7,17)-(7,18)
(7,17)-(7,24)
(7,19)-(7,20)
(7,28)-(7,64)
(7,36)-(7,37)
(7,41)-(7,55)
(7,41)-(7,64)
(7,63)-(7,64)
*)
