
let x l = List.map string_of_int;;

let y = [1; 2; 3];;

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with | [] -> [] | h::t -> (mulByDigit i t) @ [x * y]);;


(* fix

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with | [] -> [] | h::t -> (mulByDigit i t) @ [h * i]);;

*)

(* changed spans
(10,69)-(10,70)
h
VarG

(10,73)-(10,74)
i
VarG

*)

(* type error slice
(2,4)-(2,35)
(2,7)-(2,33)
(4,4)-(4,20)
(4,9)-(4,18)
(10,69)-(10,70)
(10,69)-(10,74)
(10,73)-(10,74)
*)
