
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match List.length t with
       | 1 -> [i * h]
       | _ -> [remainder h i] @ (((i * h) / 10) + (mulByDigit i t)));;


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
(10,34)-(10,41)
(10,44)-(10,46)
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
(10,50)-(10,66)
(10,51)-(10,61)
*)
