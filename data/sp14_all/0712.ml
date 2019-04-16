
let rec digitsOfInt n =
  if ((n mod 2) = 0) && (n > 0)
  then
    let rec loop input =
      if input = 0 then [] else (loop (input / 10)) @ [input mod 10] in
    loop n
  else [];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  if xs = [] then 0 else (let h::t = xs in h + (sumList t));;

let rec additivePersistence n =
  if (n / 10) = 0 then n else additivePersistence (sumList digits n);;


(* fix

let rec digitsOfInt n =
  if ((n mod 2) = 0) && (n > 0)
  then
    let rec loop input =
      if input = 0 then [] else (loop (input / 10)) @ [input mod 10] in
    loop n
  else [];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  if xs = [] then 0 else (let h::t = xs in h + (sumList t));;

let rec additivePersistence n =
  if (n / 10) = 0 then n else additivePersistence (sumList (digits n));;

*)

(* changed spans
(16,51)-(16,69)
sumList (digits n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(13,44)-(13,59)
(13,48)-(13,59)
(13,49)-(13,56)
(16,51)-(16,69)
(16,52)-(16,59)
*)
