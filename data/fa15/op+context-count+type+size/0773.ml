
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat (";" List.map (f l))) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;

*)

(* changed spans
(9,30)-(9,62)
(9,31)-(9,40)
(9,42)-(9,45)
(9,46)-(9,54)
(9,55)-(9,60)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(2,22)-(7,58)
(9,29)-(9,69)
(9,30)-(9,62)
(9,31)-(9,40)
(9,41)-(9,61)
(9,42)-(9,45)
(9,63)-(9,64)
*)
