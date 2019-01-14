
let rec mulByDigit i l =
  if (List.length l) = 1
  then [l * i]
  else
    (match l with
     | [] -> []
     | z::x::x' ->
         [(z * i) / 10] @ ((mulByDigit i [((z * i) mod 10) + x]) @ x'));;


(* fix

let rec mulByDigit i l =
  if (List.length l) = 1
  then let x::x' = l in [x * i]
  else
    (match l with
     | [] -> []
     | z::x::x' ->
         [(z * i) / 10] @ ((mulByDigit i [((z * i) mod 10) + x]) @ x'));;

*)

(* changed spans
(4,7)-(4,14)
l
VarG

(4,7)-(4,14)
let x :: x' = l in [x * i]
LetG NonRec (fromList [VarG]) (ListG EmptyG Nothing)

(4,8)-(4,9)
x
VarG

*)
