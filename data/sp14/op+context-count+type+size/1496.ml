
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
(13,7)-(13,61)
(13,12)-(13,61)
(13,15)-(13,34)
*)

(* type error slice
(8,36)-(8,51)
(8,40)-(8,51)
(8,41)-(8,48)
(11,2)-(14,16)
(11,10)-(11,13)
(12,2)-(14,16)
(12,2)-(14,16)
(13,7)-(13,61)
(13,12)-(13,61)
(13,13)-(13,14)
(14,7)-(14,14)
(14,7)-(14,16)
*)
