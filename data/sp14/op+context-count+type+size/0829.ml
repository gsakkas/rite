
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " ["["; List.map f l; "]"];;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  sepConcat "; " (List.append ("[" :: (List.map f l)) ["]"]);;

*)

(* changed spans
(9,38)-(9,62)
(9,39)-(9,42)
(9,58)-(9,61)
*)

(* type error slice
(9,38)-(9,62)
(9,38)-(9,62)
(9,39)-(9,42)
(9,44)-(9,52)
(9,44)-(9,56)
*)
