
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (h ^ sep) ^ x in
      let base = "" in let l = h in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = (h ^ sep) ^ x in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,32)
*)

(* type error slice
(6,18)-(6,27)
(6,19)-(6,20)
(6,21)-(6,22)
(7,23)-(7,59)
(7,31)-(7,32)
(7,36)-(7,50)
(7,36)-(7,59)
(7,58)-(7,59)
*)
