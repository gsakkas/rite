
let rec digitsOfInt n = if n < 0 then [];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let rec loop n acc =
       if n = 0 then acc else loop (n / 10) ((n mod 10) :: acc) in
     match n with | 0 -> [0] | _ -> loop n []);;

*)

(* changed spans
(2,24)-(2,40)
let rec loop =
  fun n ->
    fun acc ->
      if n = 0
      then acc
      else loop (n / 10)
                ((n mod 10) :: acc) in
match n with
| 0 -> [0]
| _ -> loop n []
LetG Rec (fromList [LamG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)
