
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
(10,72)-(10,73)
h
VarG

*)
