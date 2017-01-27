
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let x = [0] in
  if (sumList (digitsOfInt n)) > 9
  then 1 :: (x additivePersistence (sumList (digitsOfInt n)))
  else sumList x;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let x = [0] in
  if (sumList (digitsOfInt n)) > 9
  then (1 :: x; additivePersistence (sumList (digitsOfInt n)))
  else sumList x;;

*)

(* changed spans
(13,8)-(13,59)
(13,14)-(13,59)
(13,16)-(13,35)
*)

(* type error slice
(5,43)-(5,54)
(5,43)-(5,62)
(5,56)-(5,62)
(8,3)-(8,63)
(8,42)-(8,49)
(8,42)-(8,51)
(8,50)-(8,51)
(11,3)-(14,17)
(11,11)-(11,14)
(11,12)-(11,13)
(12,3)-(14,17)
(12,16)-(12,27)
(12,16)-(12,29)
(12,28)-(12,29)
(13,8)-(13,59)
(13,14)-(13,15)
(13,14)-(13,59)
(13,16)-(13,35)
(13,37)-(13,44)
(13,37)-(13,59)
(13,46)-(13,57)
(13,46)-(13,59)
(13,58)-(13,59)
(14,8)-(14,15)
(14,8)-(14,17)
(14,16)-(14,17)
*)
