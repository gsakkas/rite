
let cout (x,y) = (x * y) mod 10;;

let rec mulByDigit i l =
  let f a x =
    let c = cout (i, x) in
    match a with | hd::tl -> [cout (hd, i)] + (mulByDigit i tl) in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;


(* fix

let cout (x,y) = (x * y) mod 10;;

let rec mulByDigit i l =
  let f a x =
    let c = cout (i, x) in
    match a with | hd::tl -> [cout (hd, i)] @ (mulByDigit i tl) in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;

*)

(* changed spans
(7,30)-(7,64)
[cout (hd , i)] @ mulByDigit i
                             tl
AppG [ListG [EmptyG],AppG [EmptyG,EmptyG]]

*)

(* type error slice
(5,3)-(9,71)
(5,9)-(7,64)
(5,11)-(7,64)
(6,5)-(7,64)
(7,5)-(7,64)
(7,11)-(7,12)
(7,30)-(7,44)
(7,30)-(7,64)
(9,38)-(9,52)
(9,38)-(9,64)
(9,53)-(9,54)
*)
