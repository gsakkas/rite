
let rec digitsOfInt n =
  if ((n mod 2) = 0) && (n > 0)
  then
    let rec loop input =
      if input < 10 then input else [loop (input / 10); input mod 10] in
    loop n
  else [];;


(* fix

let rec digitsOfInt n =
  if ((n mod 2) = 0) && (n > 0)
  then
    let rec loop input =
      if input < 10
      then [input]
      else (let y::[] = loop (input / 10) in [y; input mod 10]) in
    loop n
  else [];;

*)

(* changed spans
(6,25)-(6,30)
(6,36)-(6,69)
(6,56)-(6,68)
*)

(* type error slice
(3,2)-(8,9)
(3,2)-(8,9)
(5,4)-(7,10)
(6,6)-(6,69)
(6,6)-(6,69)
(6,9)-(6,14)
(6,9)-(6,19)
(6,9)-(6,19)
(6,17)-(6,19)
(6,25)-(6,30)
(6,36)-(6,69)
(6,36)-(6,69)
(6,36)-(6,69)
(6,37)-(6,41)
(6,37)-(6,54)
(6,56)-(6,68)
(7,4)-(7,8)
(7,4)-(7,10)
(8,7)-(8,9)
*)
