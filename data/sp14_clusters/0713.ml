
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
[input]
ListG VarG Nothing

(6,36)-(6,69)
let y :: [] =
  loop (input / 10) in
[y ; input mod 10]
LetG NonRec [AppG [EmptyG]] (ListG EmptyG Nothing)

(6,56)-(6,68)
y
VarG

(6,56)-(6,68)
[y ; input mod 10]
ListG VarG Nothing

*)
