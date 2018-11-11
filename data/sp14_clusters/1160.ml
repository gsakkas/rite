
let rec digitsOfInt n =
  let rec integers a b =
    if a = 0 then b else integers (a / 10) ((a mod 10) :: b) in
  integers n 0;;


(* fix

let rec digitsOfInt n =
  if n = 0
  then [0]
  else
    (let rec integers a b =
       if a = 0 then b else integers (a / 10) ((a mod 10) :: b) in
     integers n []);;

*)

(* changed spans
(3,2)-(5,14)
n
VarG

(3,2)-(5,14)
n = 0
BopG VarG LitG

(3,2)-(5,14)
0
LitG

(3,2)-(5,14)
0
LitG

(3,2)-(5,14)
if n = 0
then [0]
else (let rec integers =
        fun a ->
          fun b ->
            if a = 0
            then b
            else integers (a / 10)
                          ((a mod 10) :: b) in
      integers n [])
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (LetG Rec [EmptyG] EmptyG)

(3,2)-(5,14)
[0]
ListG LitG Nothing

(5,13)-(5,14)
[]
ListG EmptyG Nothing

*)
