
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
(9,23)-(9,60)
(9,24)-(9,40)
(9,25)-(9,34)
(9,35)-(9,39)
(9,42)-(9,59)
(9,43)-(9,51)
(9,52)-(9,58)
*)

(* type error slice
(9,42)-(9,59)
(9,43)-(9,51)
(9,52)-(9,58)
*)
