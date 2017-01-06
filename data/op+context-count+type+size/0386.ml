
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = [] in let l = sl in List.fold_left f base l;;



let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep ^ a) in
      let base = sep in let l = sl in List.fold_left f base l;;


(* changed spans
(7,18)-(7,20)
*)

(* type error slice
(7,38)-(7,61)
*)
