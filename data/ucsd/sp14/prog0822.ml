
let rec sumList xs =
  match xs with | [] -> 0 | f::b -> f + (sumList (List.tl xs));;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10
    then [n]
    else (let x = [n mod 10] in (digitsOfInt (n / 10)) @ x);;

let digits n = digitsOfInt (abs n);;

let rec persistenceHelper q =
  let x = sumList q in
  if x < 10 then 1 else 1 + (persistenceHelper (digits x));;

let additivePersistence n =
  let x = digits n in if (abs n) < 10 then 0 else persistenceHelper x;;

let _ = additivePersistence - 9;;
