
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = "" in let l = t :: h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = "" in let l = h :: t in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,32)
(7,41)-(7,64)
*)

(* type error slice
(3,2)-(7,64)
(7,31)-(7,32)
(7,31)-(7,37)
(7,36)-(7,37)
*)

(* all spans
(2,18)-(7,64)
(2,22)-(7,64)
(3,2)-(7,64)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,64)
(6,12)-(6,23)
(6,14)-(6,23)
(6,18)-(6,23)
(6,20)-(6,21)
(6,18)-(6,19)
(6,22)-(6,23)
(7,6)-(7,64)
(7,17)-(7,19)
(7,23)-(7,64)
(7,31)-(7,37)
(7,31)-(7,32)
(7,36)-(7,37)
(7,41)-(7,64)
(7,41)-(7,55)
(7,56)-(7,57)
(7,58)-(7,62)
(7,63)-(7,64)
*)
