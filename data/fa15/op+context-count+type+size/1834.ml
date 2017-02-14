
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::[] -> "[" ^ (x ^ "]")
  | l -> sepConcat (";", (List.map (f, l)));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::[] -> "[" ^ (x ^ "]")
  | l -> sepConcat "" (List.map f l);;

*)

(* changed spans
(13,9)-(13,43)
(13,19)-(13,43)
(13,20)-(13,23)
(13,25)-(13,42)
(13,26)-(13,34)
(13,35)-(13,41)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(6,22)-(6,31)
(6,23)-(6,26)
(6,27)-(6,28)
(13,9)-(13,18)
(13,9)-(13,43)
(13,19)-(13,43)
(13,25)-(13,42)
(13,26)-(13,34)
(13,35)-(13,41)
*)
