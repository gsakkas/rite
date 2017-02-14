
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
(3,3)-(9,40)
(4,5)-(8,69)
(5,14)-(5,15)
(5,14)-(5,19)
(5,17)-(5,19)
(7,9)-(8,69)
(7,25)-(7,35)
(7,25)-(7,39)
(7,36)-(7,37)
(7,38)-(7,39)
(8,9)-(8,69)
(8,20)-(8,32)
(8,38)-(8,41)
(8,38)-(8,46)
(8,38)-(8,69)
(8,44)-(8,46)
(8,51)-(8,69)
(9,3)-(9,40)
(9,6)-(9,10)
(9,6)-(9,14)
(9,13)-(9,14)
(9,20)-(9,31)
(9,37)-(9,40)
*)

(* type error slice
(2,4)-(9,42)
(2,20)-(9,40)
(2,22)-(9,40)
(3,3)-(9,40)
(7,9)-(8,69)
(7,25)-(7,35)
(7,25)-(7,39)
(9,3)-(9,40)
(9,20)-(9,31)
*)
