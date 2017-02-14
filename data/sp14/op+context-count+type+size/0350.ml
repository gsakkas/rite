
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = "" in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,30)-(7,32)
*)

(* type error slice
(7,22)-(7,59)
(7,30)-(7,32)
(7,36)-(7,50)
(7,36)-(7,59)
(7,58)-(7,59)
*)
