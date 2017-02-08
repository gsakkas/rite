
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let count = [0] in
  if (sumList (digitsOfInt n)) > 9 then 1 :: count else sumList count;;


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
(11,3)-(12,70)
(11,15)-(11,18)
(11,16)-(11,17)
(12,3)-(12,70)
(12,41)-(12,42)
(12,41)-(12,51)
(12,46)-(12,51)
(12,57)-(12,64)
(12,65)-(12,70)
*)

(* type error slice
(8,37)-(8,51)
(8,42)-(8,49)
(8,42)-(8,51)
(12,3)-(12,70)
(12,3)-(12,70)
(12,41)-(12,51)
(12,57)-(12,64)
(12,57)-(12,70)
*)
