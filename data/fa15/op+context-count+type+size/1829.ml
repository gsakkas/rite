
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
  | l -> sepConcat (", " List.map (f l));;


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
(13,10)-(13,39)
(13,21)-(13,25)
(13,21)-(13,39)
(13,36)-(13,39)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(10,3)-(13,39)
(10,3)-(13,39)
(11,11)-(11,15)
(13,10)-(13,19)
(13,10)-(13,39)
(13,21)-(13,25)
(13,21)-(13,39)
*)
