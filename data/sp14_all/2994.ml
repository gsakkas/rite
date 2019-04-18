
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec digitsOfInt n =
  if n <= 0 then [] else int_of_char explode (string_of_int n);;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let rec loop n a = if n = 0 then a else loop (n / 10) ((n mod 10) :: a) in
     match n with | 0 -> [0] | _ -> loop n []);;

*)

(* changed spans
(8,26)-(8,63)
let rec loop =
  fun n ->
    fun a ->
      if n = 0
      then a
      else loop (n / 10)
                ((n mod 10) :: a) in
match n with
| 0 -> [0]
| _ -> loop n []
LetG Rec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (CaseG (fromList [(LitPatG,Nothing,EmptyG),(WildPatG,Nothing,EmptyG)]))

*)

(* type error slice
(8,26)-(8,37)
(8,26)-(8,63)
*)
