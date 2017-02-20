
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match List.length t with
       | 1 -> [i * h]
       | _ -> [remainder h i] @ ([(i * h) / 10] + (mulByDigit i t)));;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match List.length t with
       | 1 -> [i * h]
       | _ -> (remainder h i) :: (mulByDigit i t));;

*)

(* changed spans
(10,14)-(10,29)
(10,14)-(10,67)
(10,30)-(10,31)
(10,32)-(10,67)
(10,33)-(10,47)
(10,34)-(10,46)
(10,35)-(10,36)
*)

(* type error slice
(4,3)-(10,70)
(4,19)-(10,68)
(4,21)-(10,68)
(5,2)-(10,68)
(8,6)-(10,68)
(9,14)-(9,21)
(10,14)-(10,67)
(10,30)-(10,31)
(10,32)-(10,67)
(10,32)-(10,67)
(10,32)-(10,67)
(10,33)-(10,47)
(10,50)-(10,66)
(10,51)-(10,61)
*)

(* all spans
(2,14)-(2,62)
(2,16)-(2,62)
(2,20)-(2,62)
(2,23)-(2,35)
(2,23)-(2,30)
(2,24)-(2,25)
(2,28)-(2,29)
(2,33)-(2,35)
(2,41)-(2,55)
(2,41)-(2,48)
(2,42)-(2,43)
(2,46)-(2,47)
(2,53)-(2,55)
(2,61)-(2,62)
(4,19)-(10,68)
(4,21)-(10,68)
(5,2)-(10,68)
(5,8)-(5,18)
(5,8)-(5,16)
(5,17)-(5,18)
(6,10)-(6,12)
(8,6)-(10,68)
(8,13)-(8,26)
(8,13)-(8,24)
(8,25)-(8,26)
(9,14)-(9,21)
(9,15)-(9,20)
(9,15)-(9,16)
(9,19)-(9,20)
(10,14)-(10,67)
(10,30)-(10,31)
(10,14)-(10,29)
(10,15)-(10,28)
(10,15)-(10,24)
(10,25)-(10,26)
(10,27)-(10,28)
(10,32)-(10,67)
(10,33)-(10,47)
(10,34)-(10,46)
(10,34)-(10,41)
(10,35)-(10,36)
(10,39)-(10,40)
(10,44)-(10,46)
(10,50)-(10,66)
(10,51)-(10,61)
(10,62)-(10,63)
(10,64)-(10,65)
*)
