
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
(7,29)-(7,43)
(7,29)-(7,63)
*)

(* type error slice
(5,2)-(9,70)
(5,8)-(7,63)
(5,10)-(7,63)
(6,4)-(7,63)
(7,4)-(7,63)
(7,4)-(7,63)
(7,4)-(7,63)
(7,10)-(7,11)
(7,29)-(7,43)
(7,29)-(7,63)
(7,29)-(7,63)
(9,37)-(9,51)
(9,37)-(9,63)
(9,52)-(9,53)
*)
