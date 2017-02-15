
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
(7,10)-(7,11)
*)

(* type error slice
(2,3)-(2,33)
(2,10)-(2,31)
(2,17)-(2,24)
(2,22)-(2,23)
(6,12)-(6,16)
(6,12)-(6,23)
(6,17)-(6,23)
(6,21)-(6,22)
(7,4)-(7,65)
(7,4)-(7,65)
(7,4)-(7,65)
(7,4)-(7,65)
(7,10)-(7,11)
*)
