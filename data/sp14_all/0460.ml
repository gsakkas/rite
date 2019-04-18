
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec helperDigits (num,newList) =
  if num < 10
  then num :: newList
  else helperDigits ((num / 10), ((num mod 10) :: newList));;

let rec digitsOfInt n = if n < 0 then [] else helperDigits (n, []);;

*)

(* changed spans
(2,41)-(2,41)
helperDigits (n , [])
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(2,25)-(2,41)
(2,39)-(2,41)
(2,41)-(2,41)
*)
