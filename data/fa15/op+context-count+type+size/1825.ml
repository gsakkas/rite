
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
  | l -> sepConcat " " List.map (f, l);;


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
(13,9)-(13,38)
(13,19)-(13,22)
(13,23)-(13,31)
(13,32)-(13,38)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(2,22)-(7,58)
(3,2)-(7,58)
(4,10)-(4,12)
(13,9)-(13,18)
(13,9)-(13,38)
*)
