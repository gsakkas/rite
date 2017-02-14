
let rec mulByDigit i l =
  let (cout,res) =
    match l with
    | [] -> (0, [])
    | h::t ->
        let (cin,acc) = mulByDigit i t in
        let sum = (i * h) + cin in ((sum / 10), ((sum mod 10) :: acc)) in
  if cout > 0 then cout :: res else res;;


(* fix

let rec mulByDigit i l =
  let rec helper acc cin =
    match l with
    | [] -> cin :: acc
    | h::t ->
        let sum = (i * h) + cin in helper ((sum mod 10) :: acc) (sum / 10) in
  helper [] 0;;

*)

(* changed spans
(3,2)-(9,39)
(4,4)-(8,70)
(5,12)-(5,19)
(5,13)-(5,14)
(5,16)-(5,18)
(7,8)-(8,70)
(7,24)-(7,34)
(7,24)-(7,38)
(7,35)-(7,36)
(7,37)-(7,38)
(8,8)-(8,70)
(8,18)-(8,31)
(8,35)-(8,70)
(8,36)-(8,46)
(8,37)-(8,40)
(8,43)-(8,45)
(8,48)-(8,69)
(9,2)-(9,39)
(9,5)-(9,9)
(9,5)-(9,13)
(9,12)-(9,13)
(9,19)-(9,30)
(9,36)-(9,39)
*)

(* type error slice
(2,3)-(9,41)
(2,19)-(9,39)
(2,21)-(9,39)
(3,2)-(9,39)
(7,8)-(8,70)
(7,24)-(7,34)
(7,24)-(7,38)
(9,2)-(9,39)
(9,19)-(9,30)
*)
