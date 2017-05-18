
let rec digitsOfIntHelper (num,numList) =
  if num < 10
  then num :: numList
  else digitsOfIntHelper ((num / 10), ((num mod 10) :: numList));;

let rec digitsOfInt n = if n < 0 then [] else digitsOfIntHelper (n, []);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistenceHelper (n,nc) =
  if n < 10
  then nc
  else additivePersistenceHelper ((sumList digitsOfInt n), (nc + 1));;
