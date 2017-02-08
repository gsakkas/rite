
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
(8,37)-(8,51)
(8,42)-(8,49)
(8,42)-(8,51)
(11,3)-(14,17)
(11,11)-(11,14)
(12,3)-(14,17)
(12,3)-(14,17)
(13,8)-(13,59)
(13,14)-(13,15)
(13,14)-(13,59)
(14,8)-(14,15)
(14,8)-(14,17)
*)
