
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
(3,2)-(7,68)
(4,10)-(4,13)
(4,11)-(4,12)
(6,6)-(7,68)
(6,22)-(6,32)
(6,22)-(6,36)
(6,33)-(6,34)
(6,35)-(6,36)
(7,6)-(7,68)
(7,16)-(7,29)
(7,33)-(7,68)
(7,34)-(7,44)
(7,35)-(7,38)
(7,41)-(7,43)
(7,46)-(7,67)
(7,63)-(7,66)
*)

(* type error slice
(2,3)-(7,70)
(2,19)-(7,68)
(2,21)-(7,68)
(3,2)-(7,68)
(3,2)-(7,68)
(4,10)-(4,13)
(6,6)-(7,68)
(6,6)-(7,68)
(6,22)-(6,32)
(6,22)-(6,36)
(7,6)-(7,68)
(7,33)-(7,68)
*)
