
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ (sepConcat ^ (";" ^ ((List.map f l) ^ "]")));;


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
(9,30)-(9,39)
(9,47)-(9,48)
(9,50)-(9,64)
(9,65)-(9,66)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(9,29)-(9,73)
(9,30)-(9,39)
(9,40)-(9,41)
(9,49)-(9,71)
(9,50)-(9,64)
(9,51)-(9,59)
(9,65)-(9,66)
*)
