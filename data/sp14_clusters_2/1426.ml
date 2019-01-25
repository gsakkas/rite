
let append x l = match l with | [] -> [x] | _ -> x :: l;;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;


(* fix

let append x l =
  let rec helper x l acc =
    match x with | [] -> l | h::t -> helper t l (h :: acc) in
  helper x l [];;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(2,38)-(2,41)
let rec helper =
  fun x ->
    fun l ->
      fun acc ->
        match x with
        | [] -> l
        | h :: t -> helper t l
                           (h :: acc) in
helper x l []
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(2,39)-(2,40)
fun x ->
  fun l ->
    fun acc ->
      match x with
      | [] -> l
      | h :: t -> helper t l
                         (h :: acc)
LamG (LamG EmptyG)

(2,39)-(2,40)
fun l ->
  fun acc ->
    match x with
    | [] -> l
    | h :: t -> helper t l
                       (h :: acc)
LamG (LamG EmptyG)

(2,39)-(2,40)
fun acc ->
  match x with
  | [] -> l
  | h :: t -> helper t l
                     (h :: acc)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(2,39)-(2,40)
match x with
| [] -> l
| h :: t -> helper t l
                   (h :: acc)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(2,49)-(2,50)
h
VarG

(2,49)-(2,50)
acc
VarG

(2,49)-(2,50)
helper
VarG

(2,49)-(2,50)
helper x l []
AppG (fromList [VarG,ListG EmptyG Nothing])

(2,49)-(2,55)
l
VarG

(2,49)-(2,55)
helper
VarG

(2,49)-(2,55)
t
VarG

(2,49)-(2,55)
l
VarG

(2,49)-(2,55)
helper t l (h :: acc)
AppG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG]))) Nothing])

(4,20)-(5,65)
[]
ListG EmptyG Nothing

*)