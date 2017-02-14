
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let y x = List.map f l in sepConcat "[" y;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let fix l x = List.map f l in sepConcat "[" l;;

*)

(* changed spans
(9,24)-(9,65)
(9,30)-(9,46)
(9,64)-(9,65)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(3,3)-(7,59)
(3,3)-(7,59)
(3,9)-(3,11)
(9,24)-(9,65)
(9,30)-(9,46)
(9,50)-(9,59)
(9,50)-(9,65)
(9,64)-(9,65)
*)
