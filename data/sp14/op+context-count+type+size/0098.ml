
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ (" " x)) in
      let base = [] in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ (" " ^ x)) in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,29)-(6,36)
(6,30)-(6,33)
(7,17)-(7,19)
*)

(* type error slice
(6,6)-(7,59)
(6,12)-(6,37)
(6,18)-(6,19)
(6,18)-(6,37)
(6,20)-(6,21)
(6,29)-(6,36)
(6,30)-(6,33)
(7,6)-(7,59)
(7,17)-(7,19)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
(7,53)-(7,57)
*)
