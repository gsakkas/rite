
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
    let f a x = failwith "to be implemented" in
    let base = [] in
    let args = failwith "to be implemented" in
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
(16,16)-(16,44)
match snd a with
| [] -> (fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
| h :: t -> (0 , [])
CaseG (AppG [EmptyG]) [(Nothing,TupleG [EmptyG,EmptyG]),(Nothing,TupleG [EmptyG,EmptyG])]

(16,25)-(16,44)
snd
VarG

(17,4)-(19,51)
a
VarG

(17,4)-(19,51)
fst
VarG

(17,4)-(19,51)
x
VarG

(17,4)-(19,51)
snd
VarG

(17,4)-(19,51)
x
VarG

(17,4)-(19,51)
fst
VarG

(17,4)-(19,51)
x
VarG

(17,4)-(19,51)
snd
VarG

(17,4)-(19,51)
x
VarG

(17,4)-(19,51)
fst
VarG

(17,4)-(19,51)
x
VarG

(17,4)-(19,51)
snd
VarG

(17,4)-(19,51)
x
VarG

(17,4)-(19,51)
fst x
AppG [VarG]

(17,4)-(19,51)
snd x
AppG [VarG]

(17,4)-(19,51)
fst x
AppG [VarG]

(17,4)-(19,51)
snd x
AppG [VarG]

(17,4)-(19,51)
fst x
AppG [VarG]

(17,4)-(19,51)
snd x
AppG [VarG]

(17,4)-(19,51)
fst x + snd x
BopG (AppG [EmptyG]) (AppG [EmptyG])

(17,4)-(19,51)
fst x + snd x
BopG (AppG [EmptyG]) (AppG [EmptyG])

(17,4)-(19,51)
(fst x + snd x) / 10
BopG (BopG EmptyG EmptyG) LitG

(17,4)-(19,51)
fst x + snd x
BopG (AppG [EmptyG]) (AppG [EmptyG])

(17,4)-(19,51)
(fst x + snd x) mod 10
BopG (BopG EmptyG EmptyG) LitG

(17,4)-(19,51)
10
LitG

(17,4)-(19,51)
10
LitG

(17,4)-(19,51)
0
LitG

(17,4)-(19,51)
(fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
TupleG [BopG EmptyG EmptyG,ListG EmptyG Nothing]

(17,4)-(19,51)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

(17,4)-(19,51)
[(fst x + snd x) / 10 ; (fst x + snd x) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(17,4)-(19,51)
[]
ListG EmptyG Nothing

(17,15)-(17,17)
0
LitG

(17,15)-(17,17)
(0 , [])
TupleG [LitG,ListG EmptyG Nothing]

(18,15)-(18,43)
List.combine
VarG

(18,15)-(18,43)
List.combine (List.rev l1)
             (List.rev l2)
AppG [AppG [EmptyG],AppG [EmptyG]]

(18,24)-(18,43)
List.rev
VarG

(19,4)-(19,51)
l1
VarG

(19,4)-(19,51)
List.rev
VarG

(19,4)-(19,51)
l2
VarG

(19,4)-(19,51)
List.rev l2
AppG [VarG]

*)
