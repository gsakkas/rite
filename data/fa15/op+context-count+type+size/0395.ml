
let rec mulByDigit i l =
  match l with
  | [] -> [0]
  | h::t ->
      let (cin,res) = mulByDigit i t in
      let sum = (i * h) + cin in ((sum / 10), ((sum mod 10) :: res));;


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
(3,3)-(7,67)
(4,11)-(4,14)
(4,12)-(4,13)
(6,7)-(7,67)
(6,23)-(6,33)
(6,23)-(6,37)
(6,34)-(6,35)
(6,36)-(6,37)
(7,7)-(7,67)
(7,18)-(7,30)
(7,36)-(7,39)
(7,36)-(7,44)
(7,36)-(7,67)
(7,42)-(7,44)
(7,49)-(7,67)
(7,64)-(7,67)
*)

(* type error slice
(2,4)-(7,71)
(2,20)-(7,67)
(2,22)-(7,67)
(3,3)-(7,67)
(3,3)-(7,67)
(4,11)-(4,14)
(6,7)-(7,67)
(6,7)-(7,67)
(6,23)-(6,33)
(6,23)-(6,37)
(7,7)-(7,67)
(7,36)-(7,67)
*)
