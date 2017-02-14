
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = ((sepConcat "; "), (List.map (f, l)));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  let newList = List.map f l in "[" ^ ((sepConcat "; " newList) ^ "]");;

*)

(* changed spans
(9,26)-(9,35)
(9,26)-(9,40)
(9,26)-(9,58)
(9,36)-(9,40)
(9,44)-(9,52)
(9,44)-(9,58)
(9,54)-(9,58)
*)

(* type error slice
(9,44)-(9,52)
(9,44)-(9,58)
(9,54)-(9,58)
*)
