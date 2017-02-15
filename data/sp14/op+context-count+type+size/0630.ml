
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = "" in
      let base = sepConcat sep t in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sepConcat sep t in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,20)
(7,6)-(7,73)
(7,44)-(7,46)
*)

(* type error slice
(7,36)-(7,73)
(7,44)-(7,46)
(7,50)-(7,64)
(7,50)-(7,73)
(7,72)-(7,73)
*)
