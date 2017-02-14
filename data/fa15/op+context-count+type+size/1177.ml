
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
(7,24)-(7,25)
*)

(* type error slice
(2,3)-(2,33)
(2,10)-(2,31)
(2,17)-(2,31)
(5,2)-(9,70)
(5,8)-(7,63)
(5,10)-(7,63)
(6,4)-(7,63)
(6,4)-(7,63)
(6,12)-(6,16)
(6,12)-(6,23)
(7,4)-(7,63)
(7,4)-(7,63)
(7,4)-(7,63)
(7,4)-(7,63)
(7,10)-(7,11)
(7,24)-(7,25)
(7,36)-(7,63)
(9,37)-(9,51)
(9,37)-(9,63)
(9,52)-(9,53)
*)
