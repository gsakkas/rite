
let rec mulByDigit i l =
  match l with
  | [] -> [0]
  | h::t ->
      let (cin,res) = mulByDigit i t in
      let sum = (i * h) + cin in ((sum / 10), ((sum mod 10) :: res));;


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
(3,2)-(7,68)
fun acc ->
  fun cin ->
    match l with
    | [] -> cin :: acc
    | h :: t -> (let sum =
                   (i * h) + cin in
                 helper ((sum mod 10) :: acc)
                        (sum / 10))
LamG (LamG EmptyG)

(3,2)-(7,68)
fun cin ->
  match l with
  | [] -> cin :: acc
  | h :: t -> (let sum =
                 (i * h) + cin in
               helper ((sum mod 10) :: acc)
                      (sum / 10))
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(3,2)-(7,68)
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

(6,35)-(6,36)
cin :: acc
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(7,6)-(7,68)
cin
VarG

(7,6)-(7,68)
acc
VarG

(7,41)-(7,43)
helper ((sum mod 10) :: acc)
       (sum / 10)
AppG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(7,46)-(7,67)
helper
VarG

(7,63)-(7,66)
acc
VarG

*)
