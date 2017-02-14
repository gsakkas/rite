
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sl ^ x) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,24)-(6,26)
*)

(* type error slice
(3,3)-(7,59)
(3,3)-(7,59)
(3,3)-(7,59)
(3,3)-(7,59)
(3,9)-(3,11)
(6,24)-(6,26)
(6,24)-(6,30)
(6,27)-(6,28)
*)
