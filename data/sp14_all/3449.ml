
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let count = [0] in
  if (sumList (digitsOfInt n)) > 9
  then (1 :: count) && (additivePersistence (sumList (digitsOfInt n)))
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
(11,15)-(11,16)
let x = 1 in
(x + 1;
if sumList (digitsOfInt n) > 9
then additivePersistence (sumList (digitsOfInt n))
else x)
LetG NonRec (fromList [LitG]) (SeqG EmptyG EmptyG)

(12,2)-(14,20)
x
VarG

(12,2)-(14,20)
x + 1
BopG VarG LitG

(12,2)-(14,20)
1
LitG

(12,2)-(14,20)
1
LitG

(12,2)-(14,20)
x + 1;
if sumList (digitsOfInt n) > 9
then additivePersistence (sumList (digitsOfInt n))
else x
SeqG (BopG EmptyG EmptyG) (IteG EmptyG EmptyG EmptyG)

(14,15)-(14,20)
x
VarG

*)
