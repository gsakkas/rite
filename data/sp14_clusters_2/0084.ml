
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "TBD" in
    let base = ([], []) in
    let args = List.combine (l1, l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match snd a with
      | [] ->
          (((fst x) + (snd x)),
            [((fst x) + (snd x)) / 10; ((fst x) + (snd x)) mod 10])
      | h::t -> (0, []) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,16)-(16,30)
match snd a with
| [] -> (fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
| h :: t -> (0 , [])
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(17,4)-(19,51)
snd
VarG

(17,15)-(17,23)
a
VarG

(17,16)-(17,18)
fst
VarG

(17,16)-(17,18)
x
VarG

(17,16)-(17,18)
snd
VarG

(17,16)-(17,18)
x
VarG

(17,16)-(17,18)
fst
VarG

(17,16)-(17,18)
x
VarG

(17,16)-(17,18)
snd
VarG

(17,16)-(17,18)
x
VarG

(17,16)-(17,18)
fst
VarG

(17,16)-(17,18)
x
VarG

(17,16)-(17,18)
snd
VarG

(17,16)-(17,18)
x
VarG

(17,16)-(17,18)
fst x
AppG (fromList [VarG])

(17,16)-(17,18)
snd x
AppG (fromList [VarG])

(17,16)-(17,18)
fst x
AppG (fromList [VarG])

(17,16)-(17,18)
snd x
AppG (fromList [VarG])

(17,16)-(17,18)
fst x
AppG (fromList [VarG])

(17,16)-(17,18)
snd x
AppG (fromList [VarG])

(17,16)-(17,18)
fst x + snd x
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(17,16)-(17,18)
fst x + snd x
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(17,16)-(17,18)
(fst x + snd x) / 10
BopG (BopG EmptyG EmptyG) LitG

(17,16)-(17,18)
fst x + snd x
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(17,16)-(17,18)
(fst x + snd x) mod 10
BopG (BopG EmptyG EmptyG) LitG

(17,16)-(17,18)
10
LitG

(17,16)-(17,18)
10
LitG

(17,16)-(17,18)
0
LitG

(17,16)-(17,18)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(17,16)-(17,18)
[(fst x + snd x) / 10 ; (fst x + snd x) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(17,20)-(17,22)
0
LitG

(17,20)-(17,22)
let base = (0 , []) in
let args =
  List.combine (List.rev l1)
               (List.rev l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(17,20)-(17,22)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(18,15)-(18,36)
List.combine (List.rev l1)
             (List.rev l2)
AppG (fromList [AppG (fromList [EmptyG])])

(18,28)-(18,36)
List.rev l1
AppG (fromList [VarG])

(18,29)-(18,31)
List.rev
VarG

(18,33)-(18,35)
List.rev
VarG

(18,33)-(18,35)
List.rev l2
AppG (fromList [VarG])

*)
