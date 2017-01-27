
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
(9,24)-(9,53)
(9,35)-(9,53)
(9,40)-(9,53)
*)

(* type error slice
(9,35)-(9,38)
(9,35)-(9,53)
(9,40)-(9,48)
(9,40)-(9,53)
*)
