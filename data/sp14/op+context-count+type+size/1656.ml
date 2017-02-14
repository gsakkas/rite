
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
(11,2)-(12,69)
(11,14)-(11,17)
(11,15)-(11,16)
(12,2)-(12,69)
(12,40)-(12,41)
(12,40)-(12,50)
(12,45)-(12,50)
(12,56)-(12,63)
(12,64)-(12,69)
*)

(* type error slice
(8,36)-(8,51)
(8,40)-(8,51)
(8,41)-(8,48)
(12,2)-(12,69)
(12,2)-(12,69)
(12,40)-(12,50)
(12,56)-(12,63)
(12,56)-(12,69)
*)
