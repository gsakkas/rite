
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) :: ((n mod 10) []);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let rec loop n x = if n = 0 then x else loop (n / 10) ((n mod 10) :: x) in
     match n with | 0 -> [0] | _ -> loop n []);;

*)

(* changed spans
(3,25)-(3,66)
let rec loop =
  fun n ->
    fun x ->
      if n = 0
      then x
      else loop (n / 10)
                ((n mod 10) :: x) in
match n with
| 0 -> [0]
| _ -> loop n []
LetG Rec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (CaseG EmptyG (fromList [(LitPatG,Nothing,EmptyG),(WildPatG,Nothing,EmptyG)]))

*)

(* type error slice
(2,4)-(3,68)
(2,21)-(3,66)
(3,3)-(3,66)
(3,25)-(3,47)
(3,25)-(3,66)
(3,26)-(3,37)
(3,51)-(3,66)
(3,52)-(3,62)
*)
