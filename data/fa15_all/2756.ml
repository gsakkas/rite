
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
[i * h]
ListG (fromList [BopG EmptyG EmptyG])

(10,15)-(10,68)
(remainder h
           i) :: (mulByDigit i t)
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(4,4)-(10,71)
(4,20)-(10,69)
(4,22)-(10,69)
(5,3)-(10,69)
(6,11)-(6,13)
(8,7)-(10,69)
(9,15)-(9,20)
(10,15)-(10,68)
(10,31)-(10,32)
(10,33)-(10,68)
(10,51)-(10,67)
(10,52)-(10,62)
*)
