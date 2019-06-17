
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let count = [] in
  if (sumList (digitsOfInt n)) > 9
  then 1 :: (count additivePersistence (sumList (digitsOfInt n)));;


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
(11,15)-(11,17)
[0]
ListG [LitG]

(13,8)-(13,66)
additivePersistence (sumList (digitsOfInt n))
AppG [AppG [EmptyG]]

(13,66)-(13,66)
sumList count
AppG [VarG]

*)

(* type error slice
(11,3)-(13,66)
(11,15)-(11,17)
(12,3)-(13,66)
(13,8)-(13,66)
(13,13)-(13,66)
(13,14)-(13,19)
(13,66)-(13,66)
*)
