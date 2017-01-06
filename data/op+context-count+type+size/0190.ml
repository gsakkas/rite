
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h "to be implemented" in
      let l = t in List.fold_left f base l;;



let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;


(* changed spans
(7,20)-(7,39)
*)

(* type error slice
(8,20)-(8,43)
*)
