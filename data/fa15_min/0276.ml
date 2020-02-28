
let cout (x,y) = (x * y) mod 10;;

let rec mulByDigit i l =
  let f a x =
    let c = cout (i, x) in
    match x with | [] -> [] | h::t -> (((h * i) + c) mod 10) :: t in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;


(* fix

let cout (x,y) = (x * y) mod 10;;

let rec mulByDigit i l =
  let f a x =
    let c = cout (i, x) in
    match a with | [] -> [] | h::t -> (((h * i) + c) mod 10) :: t in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;

*)

(* changed spans
(7,11)-(7,12)
a
VarG

*)

(* type error slice
(2,4)-(2,34)
(2,11)-(2,32)
(2,18)-(2,25)
(2,23)-(2,24)
(6,13)-(6,17)
(6,13)-(6,24)
(6,18)-(6,24)
(6,22)-(6,23)
(7,5)-(7,66)
(7,11)-(7,12)
*)
