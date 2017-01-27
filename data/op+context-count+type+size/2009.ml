
let x = 123;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = n / 10
     and y = n mod 10 in
     if (x = 0) && (y = 0) then [] else (digitsOfInt x) @ [y]);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let x = sumList (digitsOfInt 30);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail -> (listReverse tail) @ [head];;

let palindrome w = if (listReverse (explode w)) = w then 1 else 0;;


(* fix

let x = 123;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = n / 10
     and y = n mod 10 in
     if (x = 0) && (y = 0) then [] else (digitsOfInt x) @ [y]);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let x = sumList (digitsOfInt 30);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail -> (listReverse tail) @ [head];;

let palindrome w =
  if (listReverse (explode w)) = (explode w) then true else false;;

*)

(* changed spans
(27,51)-(27,52)
(27,58)-(27,59)
(27,65)-(27,66)
*)

(* type error slice
(16,4)-(19,9)
(16,13)-(19,7)
(17,3)-(19,7)
(18,14)-(18,27)
(18,14)-(18,29)
(18,28)-(18,29)
(18,56)-(18,58)
(18,56)-(18,65)
(18,60)-(18,65)
(19,3)-(19,5)
(19,3)-(19,7)
(19,6)-(19,7)
(22,3)-(25,46)
(25,20)-(25,31)
(25,20)-(25,36)
(25,32)-(25,36)
(27,24)-(27,35)
(27,24)-(27,46)
(27,24)-(27,52)
(27,37)-(27,44)
(27,37)-(27,46)
(27,45)-(27,46)
(27,51)-(27,52)
*)
