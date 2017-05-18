
let rec lastListElement n =
  match n with
  | [] -> failwith "ERROR: List must be of size 1 or greater"
  | x::[] -> x
  | x::y -> lastListElement y;;

let rec popOffLast n =
  match n with | [] -> [] | x::[] -> [] | x::y -> x :: (popOffLast y);;

let rec catLists x y =
  if y = []
  then x
  else
    (match x with
     | [] -> y
     | x::[] -> x :: y
     | h::t -> catLists (popOffLast x) ((lastListElement x) :: y));;

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else digitsOfInt (catLists (n / 10) [n mod 10]);;
