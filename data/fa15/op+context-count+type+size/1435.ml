
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match List.length t with
       | 1 -> i * h
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
(9,15)-(9,20)
(10,15)-(10,30)
(10,15)-(10,66)
(10,31)-(10,32)
(10,36)-(10,37)
(10,36)-(10,41)
(10,36)-(10,47)
(10,36)-(10,66)
(10,40)-(10,41)
(10,45)-(10,47)
*)

(* type error slice
(4,4)-(10,71)
(4,20)-(10,66)
(4,22)-(10,66)
(5,3)-(10,66)
(5,3)-(10,66)
(6,11)-(6,13)
(8,8)-(10,66)
(9,15)-(9,20)
(10,15)-(10,66)
(10,31)-(10,32)
(10,36)-(10,66)
(10,36)-(10,66)
(10,52)-(10,62)
(10,52)-(10,66)
*)
