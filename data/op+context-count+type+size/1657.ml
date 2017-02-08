
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
(11,3)-(14,21)
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
(8,37)-(8,51)
(8,42)-(8,49)
(8,42)-(8,51)
(11,3)-(14,21)
(11,15)-(11,18)
(12,3)-(14,21)
(12,3)-(14,21)
(13,8)-(13,63)
(13,14)-(13,19)
(13,14)-(13,63)
(14,8)-(14,15)
(14,8)-(14,21)
*)
