
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
(8,25)-(8,62)
n
VarG

(8,25)-(8,62)
a
VarG

(8,25)-(8,62)
fun n ->
  fun a ->
    if n = 0
    then a
    else loop (n / 10)
              ((n mod 10) :: a)
LamG (LamG EmptyG)

(8,25)-(8,62)
fun a ->
  if n = 0
  then a
  else loop (n / 10)
            ((n mod 10) :: a)
LamG (IteG EmptyG EmptyG EmptyG)

(8,25)-(8,62)
n = 0
BopG VarG LitG

(8,25)-(8,62)
0
LitG

(8,25)-(8,62)
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
LetG Rec (fromList [LamG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(8,25)-(8,62)
if n = 0
then a
else loop (n / 10)
          ((n mod 10) :: a)
IteG (BopG EmptyG EmptyG) VarG (AppG (fromList [EmptyG]))

(8,46)-(8,59)
loop
VarG

(8,60)-(8,61)
n / 10
BopG VarG LitG

*)
