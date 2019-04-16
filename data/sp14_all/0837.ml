
let rec addList xs = match xs with | [] -> 0 | h::t -> h + (addList t);;

let rec digitsOfInt n =
  if n < 1 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec additivePersistence n =
  let count = 0 in
  if (List.length (digitsOfInt n)) = 1
  then count
  else count = (count + (1 additivePersistence (addList (digitsOfInt n))));;


(* fix

let rec addList xs = match xs with | [] -> 0 | h::t -> h + (addList t);;

let rec digitsOfInt n =
  if n < 1 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec addNum n = if n < 10 then n else addList (digitsOfInt n);;

let rec addHelp (count,n) =
  if n < 10 then count + 1 else addHelp ((count + 1), (addNum n));;

let rec additivePersistence n = addHelp (0, n);;

*)

(* changed spans
(8,3)-(11,75)
addHelp (0 , n)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(8,3)-(11,75)
(8,15)-(8,16)
(9,3)-(11,75)
(10,8)-(10,13)
(11,8)-(11,75)
(11,25)-(11,74)
(11,26)-(11,27)
*)
