
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
(6,23)-(6,25)
*)

(* type error slice
(3,2)-(7,58)
(3,2)-(7,58)
(3,2)-(7,58)
(3,2)-(7,58)
(3,8)-(3,10)
(6,22)-(6,30)
(6,23)-(6,25)
(6,26)-(6,27)
*)
