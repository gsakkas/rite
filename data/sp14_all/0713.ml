
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
(6,26)-(6,31)
[input]
ListG (fromList [VarG])

(6,37)-(6,70)
let y :: [] =
  loop (input / 10) in
[y ; input mod 10]
LetG NonRec (fromList [(ConsPatG VarPatG (ConPatG Nothing),AppG (fromList [EmptyG]))]) (ListG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(8,10)
(5,5)-(7,11)
(6,7)-(6,70)
(6,10)-(6,15)
(6,10)-(6,20)
(6,18)-(6,20)
(6,26)-(6,31)
(6,37)-(6,70)
(6,38)-(6,42)
(6,38)-(6,55)
(6,57)-(6,69)
(7,5)-(7,9)
(7,5)-(7,11)
(8,8)-(8,10)
*)
