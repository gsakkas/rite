
let cout (x,y) = (x * y) mod 10;;

let rec mulByDigit i l =
  let f a x =
    let c = cout (i, x) in
    match a with | hd::tl -> (cout (hd, i)) @ (mulByDigit i tl) in
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
(7,31)-(7,42)
*)

(* type error slice
(2,4)-(2,34)
(2,11)-(2,32)
(2,19)-(2,32)
(7,31)-(7,35)
(7,31)-(7,42)
(7,31)-(7,63)
(7,45)-(7,46)
*)
