
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = if t = sep then sep else h ^ sep in
      let l = sl in List.fold_left f base l;;



let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ x in
      let base = if t = [] then sep else h in
      let l = sl in List.fold_left f base l;;


(* changed spans
(7,25)-(7,28)
(7,45)-(7,50)
*)

(* type error slice
(7,21)-(7,28)
(7,43)-(7,50)
*)
