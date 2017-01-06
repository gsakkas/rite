
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a x in
      let base = "" in let l = h in List.fold_left f base l;;



let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x in let base = h in let l = t in List.fold_left f base l;;


(* changed spans
(6,19)-(6,20)
(7,18)-(7,20)
(7,32)-(7,33)
*)

(* type error slice
(7,37)-(7,60)
*)
