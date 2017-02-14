
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
  let count = [0] in
  if (sumList (digitsOfInt n)) > 9
  then additivePersistence (sumList (digitsOfInt n))
  else sumList count;;

*)

(* changed spans
(13,7)-(13,8)
(13,7)-(13,65)
(13,12)-(13,65)
(13,13)-(13,18)
*)

(* type error slice
(8,36)-(8,51)
(8,40)-(8,51)
(8,41)-(8,48)
(11,2)-(14,20)
(11,14)-(11,17)
(12,2)-(14,20)
(12,2)-(14,20)
(13,7)-(13,65)
(13,12)-(13,65)
(13,13)-(13,18)
(14,7)-(14,14)
(14,7)-(14,20)
*)
