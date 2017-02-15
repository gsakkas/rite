
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ x in
      let base = "" in let l = sl in List.fold_left f base;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ a in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,24)-(6,25)
(7,37)-(7,58)
*)

(* type error slice
(3,2)-(7,58)
(3,2)-(7,58)
(4,10)-(4,12)
(6,6)-(7,58)
(7,6)-(7,58)
(7,23)-(7,58)
(7,37)-(7,51)
(7,37)-(7,58)
*)
