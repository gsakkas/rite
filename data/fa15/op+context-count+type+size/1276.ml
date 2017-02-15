
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = ("[" sepConcat "" (List.map f l)) ^ "]";;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat " " (List.map f l)) ^ "]");;

*)

(* changed spans
(9,23)-(9,56)
(9,28)-(9,37)
(9,38)-(9,40)
*)

(* type error slice
(9,23)-(9,56)
(9,24)-(9,27)
*)
