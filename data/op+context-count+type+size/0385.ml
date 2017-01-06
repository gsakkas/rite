
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ x in
      let base = "" in let l = sl in List.fold_left f base;;



let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = sep ^ a in
      let base = "" in let l = sl in List.fold_left f base l;;


(* changed spans
(6,25)-(6,26)
*)

(* type error slice
(7,38)-(7,59)
*)
