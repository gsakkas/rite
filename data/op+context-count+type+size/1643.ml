
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let count = [0] in
  if (sumList (digitsOfInt n)) > 9
  then 1 :: (count additivePersistence (sumList (digitsOfInt n)))
  else sumList count;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let x = 1 in
  x + 1;
  if (sumList (digitsOfInt n)) > 9
  then additivePersistence (sumList (digitsOfInt n))
  else x;;

*)

(* changed spans
(11,15)-(11,18)
(11,16)-(11,17)
(12,3)-(14,21)
(13,8)-(13,9)
(13,8)-(13,63)
(13,14)-(13,19)
(13,14)-(13,63)
(14,8)-(14,15)
(14,8)-(14,21)
(14,16)-(14,21)
*)

(* type error slice
(5,43)-(5,54)
(5,43)-(5,62)
(5,56)-(5,62)
(8,3)-(8,63)
(8,42)-(8,49)
(8,42)-(8,51)
(8,50)-(8,51)
(11,3)-(14,21)
(11,15)-(11,18)
(11,16)-(11,17)
(12,3)-(14,21)
(12,16)-(12,27)
(12,16)-(12,29)
(12,28)-(12,29)
(13,8)-(13,63)
(13,14)-(13,19)
(13,14)-(13,63)
(13,20)-(13,39)
(13,41)-(13,48)
(13,41)-(13,63)
(13,50)-(13,61)
(13,50)-(13,63)
(13,62)-(13,63)
(14,8)-(14,15)
(14,8)-(14,21)
(14,16)-(14,21)
*)
