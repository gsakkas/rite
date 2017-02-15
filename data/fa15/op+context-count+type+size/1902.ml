
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
(4,7)-(4,14)
(4,8)-(4,9)
*)

(* type error slice
(3,5)-(3,20)
(3,6)-(3,17)
(3,18)-(3,19)
(4,8)-(4,9)
(4,8)-(4,13)
*)
