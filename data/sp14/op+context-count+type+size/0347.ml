
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = h in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,19)
(6,18)-(6,23)
(6,20)-(6,21)
(7,6)-(7,59)
(7,22)-(7,59)
(7,30)-(7,32)
(7,36)-(7,59)
*)

(* type error slice
(7,22)-(7,59)
(7,30)-(7,32)
(7,36)-(7,50)
(7,36)-(7,59)
(7,58)-(7,59)
*)
