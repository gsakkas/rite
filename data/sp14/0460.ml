
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec helperDigits (num,newList) =
  if num < 10
  then num :: newList
  else helperDigits ((num / 10), ((num mod 10) :: newList));;

let rec digitsOfInt n = if n < 0 then [] else helperDigits (n, []);;

*)

(* changed spans
(2,20)-(2,40)
(2,24)-(2,40)
*)

(* type error slice
(2,24)-(2,40)
(2,38)-(2,40)
*)

(* all spans
(2,20)-(2,40)
(2,24)-(2,40)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,38)-(2,40)
*)
