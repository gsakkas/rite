
let cout (x,y) = (x * y) mod 10;;

let rec mulByDigit i l =
  let f a x =
    let c = cout (i, x) in
    match a with | _ -> c | h::t -> (((h * i) + c) mod 10) :: t in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;


(* fix

let cout (x,y) = (x * y) mod 10;;

let rec mulByDigit i l =
  let f a x =
    let c = cout (i, x) in
    match a with | _ -> [c] | h::t -> (((h * i) + c) mod 10) :: t in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;

*)

(* changed spans
(7,25)-(7,26)
[c]
ListG [VarG]

*)

(* type error slice
(2,4)-(2,34)
(2,11)-(2,32)
(2,18)-(2,32)
(5,3)-(9,71)
(5,9)-(7,64)
(5,11)-(7,64)
(6,5)-(7,64)
(6,13)-(6,17)
(6,13)-(6,24)
(7,5)-(7,64)
(7,11)-(7,12)
(7,25)-(7,26)
(7,37)-(7,64)
(9,38)-(9,52)
(9,38)-(9,64)
(9,53)-(9,54)
*)
