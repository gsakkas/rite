
let rec clone x n = if n < 1 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 < length2
  then (((clone 0 (length2 - length1)) @ l1), l2)
  else
    if length2 < length1
    then (l1, ((clone 0 (length1 - length2)) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else [h] @ t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (carry,rest) = a in
      ((((j + k) + carry) / 10), ([((j + k) + carry) mod 10] @ rest)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (car,res) = List.fold_left f base args in [car] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | n -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (pow,total) = a in
    ((pow + 1), (total + ((mulByDigit (x l2)) * (10 ** pow)))) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 < length2
  then (((clone 0 (length2 - length1)) @ l1), l2)
  else
    if length2 < length1
    then (l1, ((clone 0 (length1 - length2)) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else [h] @ t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (carry,rest) = a in
      ((((j + k) + carry) / 10), ([((j + k) + carry) mod 10] @ rest)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (car,res) = List.fold_left f base args in [car] @ res in
  removeZero (add (padZero l1 l2));;

let rec listZeros n =
  match n with | 0 -> [] | 1 -> [0] | x -> [0] @ (listZeros (n - 1));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | n -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (pow,total) = a in
    ((pow + 1), ((bigAdd total (mulByDigit x l2)) @ (listZeros pow))) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(28,19)-(29,72)
n
VarG

(28,19)-(29,72)
(@)
VarG

(28,19)-(29,72)
listZeros
VarG

(28,19)-(29,72)
n
VarG

(28,19)-(29,72)
fun n ->
  match n with
  | 0 -> []
  | 1 -> [0]
  | x -> [0] @ listZeros (n - 1)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(28,19)-(29,72)
[0] @ listZeros (n - 1)
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(28,19)-(29,72)
listZeros (n - 1)
AppG (fromList [BopG EmptyG EmptyG])

(28,19)-(29,72)
n - 1
BopG VarG LitG

(28,19)-(29,72)
0
LitG

(28,19)-(29,72)
0
LitG

(28,19)-(29,72)
1
LitG

(28,19)-(29,72)
match n with
| 0 -> []
| 1 -> [0]
| x -> [0] @ listZeros (n - 1)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(28,19)-(29,72)
[]
ListG EmptyG Nothing

(28,19)-(29,72)
[0]
ListG LitG Nothing

(28,19)-(29,72)
[0]
ListG LitG Nothing

(34,16)-(34,61)
bigAdd total (mulByDigit x
                         l2) @ listZeros pow
AppG (fromList [AppG (fromList [EmptyG])])

(34,17)-(34,22)
bigAdd
VarG

(34,17)-(34,22)
(@)
VarG

(34,17)-(34,22)
bigAdd total (mulByDigit x l2)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(34,26)-(34,45)
mulByDigit x l2
AppG (fromList [VarG])

(34,49)-(34,51)
listZeros pow
AppG (fromList [VarG])

(34,55)-(34,58)
listZeros
VarG

*)
