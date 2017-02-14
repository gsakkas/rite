
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
  | l -> List.map (f, (sepConcat ";" l));;


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
(13,10)-(13,18)
(13,10)-(13,39)
(13,20)-(13,21)
(13,20)-(13,39)
(13,34)-(13,37)
(13,38)-(13,39)
*)

(* type error slice
(13,10)-(13,18)
(13,10)-(13,39)
(13,20)-(13,39)
*)
