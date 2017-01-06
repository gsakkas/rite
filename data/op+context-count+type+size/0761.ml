
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = "" in
      let base = sepConcat sep [] in let l = "" in List.fold_left f base l;;



let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = sepConcat sep t in let l = t in List.fold_left f base l;;


(* changed spans
(6,19)-(6,21)
(7,32)-(7,34)
(7,46)-(7,48)
*)

(* type error slice
(7,52)-(7,75)
*)
