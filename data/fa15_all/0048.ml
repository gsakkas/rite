
let rec mulByDigit i l =
  let (cout,res) =
    match l with
    | [] -> (0, [])
    | h::t ->
        let (cin,acc) = mulByDigit i t in
        let sum = (i * h) + cin in ((sum / 10), ((sum mod 10) :: acc)) in
  if cout > 0 then cout :: res else res;;


(* fix

let rec mulByDigit i l =
  let rec helper acc cin =
    match l with
    | [] -> cin :: acc
    | h::t ->
        let sum = (i * h) + cin in helper ((sum mod 10) :: acc) (sum / 10) in
  helper [] 0;;

*)

(* changed spans
(3,2)-(9,39)
let rec helper =
  fun acc ->
    fun cin ->
      match l with
      | [] -> cin :: acc
      | h :: t -> (let sum =
                     (i * h) + cin in
                   helper ((sum mod 10) :: acc)
                          (sum / 10)) in
helper [] 0
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(4,4)-(8,70)
fun acc ->
  fun cin ->
    match l with
    | [] -> cin :: acc
    | h :: t -> (let sum =
                   (i * h) + cin in
                 helper ((sum mod 10) :: acc)
                        (sum / 10))
LamG (LamG EmptyG)

(4,4)-(8,70)
fun cin ->
  match l with
  | [] -> cin :: acc
  | h :: t -> (let sum =
                 (i * h) + cin in
               helper ((sum mod 10) :: acc)
                      (sum / 10))
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,37)-(7,38)
cin :: acc
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(8,8)-(8,70)
cin
VarG

(8,8)-(8,70)
acc
VarG

(8,43)-(8,45)
helper ((sum mod 10) :: acc)
       (sum / 10)
AppG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(8,48)-(8,69)
helper
VarG

(9,5)-(9,9)
sum / 10
BopG VarG LitG

(9,12)-(9,13)
sum
VarG

(9,12)-(9,13)
helper
VarG

(9,12)-(9,13)
helper [] 0
AppG (fromList [LitG,ListG EmptyG Nothing])

(9,12)-(9,13)
10
LitG

(9,12)-(9,13)
[]
ListG EmptyG Nothing

*)
