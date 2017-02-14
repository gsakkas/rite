
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x c = a ^ (sep ^ x) in
      let base = "" in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = "" in let l = [] in List.fold_left f base l;;

*)

(* changed spans
(6,16)-(6,33)
(7,31)-(7,33)
*)

(* type error slice
(6,6)-(7,60)
(6,12)-(6,33)
(6,14)-(6,33)
(6,16)-(6,33)
(6,20)-(6,21)
(6,20)-(6,33)
(6,22)-(6,23)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
*)
