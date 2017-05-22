
let stringOfList f l =
  match l with | [] -> "[]" | x::[] -> "[" ^ (x ^ "]") | l -> List.map (f, l);;


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
(2,17)-(3,77)
(3,62)-(3,70)
(3,62)-(3,77)
(3,71)-(3,77)
*)

(* type error slice
(3,62)-(3,70)
(3,62)-(3,77)
(3,71)-(3,77)
*)

(* all spans
(2,17)-(3,77)
(2,19)-(3,77)
(3,2)-(3,77)
(3,8)-(3,9)
(3,23)-(3,27)
(3,39)-(3,54)
(3,43)-(3,44)
(3,39)-(3,42)
(3,45)-(3,54)
(3,48)-(3,49)
(3,46)-(3,47)
(3,50)-(3,53)
(3,62)-(3,77)
(3,62)-(3,70)
(3,71)-(3,77)
(3,72)-(3,73)
(3,75)-(3,76)
*)
