
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (" " (List.map (f l)));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat " " l;;

*)

(* changed spans
(9,23)-(9,55)
(9,33)-(9,55)
(9,38)-(9,54)
*)

(* type error slice
(9,33)-(9,55)
(9,34)-(9,37)
*)
