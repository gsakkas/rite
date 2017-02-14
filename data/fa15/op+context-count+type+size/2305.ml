
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l l = sepConcat "; " (List.map (f, l));;


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
(9,22)-(9,56)
(9,42)-(9,56)
(9,52)-(9,56)
*)

(* type error slice
(9,42)-(9,50)
(9,42)-(9,56)
(9,52)-(9,56)
*)
