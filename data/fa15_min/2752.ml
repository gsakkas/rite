
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let x l = List.map string_of_int;;

let y = [1; 2; 3];;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [remainder x y] @ (mulByDigit i t);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [remainder i h] @ (mulByDigit i t);;

*)

(* changed spans
(11,24)-(11,25)
i
VarG

(11,26)-(11,27)
h
VarG

*)

(* type error slice
(2,4)-(2,65)
(2,15)-(2,63)
(2,24)-(2,31)
(2,25)-(2,26)
(4,4)-(4,35)
(4,7)-(4,33)
(11,14)-(11,23)
(11,14)-(11,27)
(11,24)-(11,25)
*)
