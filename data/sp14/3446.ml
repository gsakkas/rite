
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
let x = 1 in
(x + 1;
if sumList (digitsOfInt n) > 9
then additivePersistence (sumList (digitsOfInt n))
else x)
LetG NonRec [(VarPatG,LitG)] (SeqG EmptyG EmptyG)

*)

(* type error slice
(8,37)-(8,52)
(8,41)-(8,52)
(8,42)-(8,49)
(11,3)-(14,21)
(11,15)-(11,18)
(12,3)-(14,21)
(13,8)-(13,66)
(13,13)-(13,66)
(13,14)-(13,19)
(14,8)-(14,15)
(14,8)-(14,21)
*)
