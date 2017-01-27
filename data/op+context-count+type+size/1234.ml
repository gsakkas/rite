
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map (sepConcat ("; " l)) l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " (List.map f l);;

*)

(* changed spans
(9,24)-(9,32)
(9,34)-(9,51)
(9,45)-(9,51)
(9,50)-(9,51)
(9,54)-(9,55)
*)

(* type error slice
(9,45)-(9,49)
(9,45)-(9,51)
(9,50)-(9,51)
*)
