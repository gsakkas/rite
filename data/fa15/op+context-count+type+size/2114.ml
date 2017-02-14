
let rec mulByDigit i l =
  if (List.length l) = 1
  then [l * i]
  else
    (match l with
     | [] -> []
     | z::x::x' ->
         [(z * i) / 10] @ ((mulByDigit i [((z * i) mod 10) + x]) @ x'));;


(* fix

let rec mulByDigit i l =
  if (List.length l) = 1
  then let x::x' = l in [x * i]
  else
    (match l with
     | [] -> []
     | z::x::x' ->
         [(z * i) / 10] @ ((mulByDigit i [((z * i) mod 10) + x]) @ x'));;

*)

(* changed spans
(4,8)-(4,15)
(4,9)-(4,10)
*)

(* type error slice
(3,7)-(3,18)
(3,7)-(3,20)
(3,19)-(3,20)
(4,9)-(4,10)
(4,9)-(4,14)
*)
