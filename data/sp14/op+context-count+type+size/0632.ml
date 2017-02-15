
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sepConcat sep t in let l = f in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sepConcat sep t in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,44)-(7,45)
*)

(* type error slice
(6,6)-(7,72)
(6,12)-(6,23)
(7,36)-(7,72)
(7,44)-(7,45)
(7,49)-(7,63)
(7,49)-(7,72)
(7,71)-(7,72)
*)
