
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (x,y) -> [a; (x + y) mod 10] in
    let base = [] in
    let args = failwith List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (y,z) ->
          let sum = y + z in
          (match a with
           | h::t -> ((sum + h) / 10) :: ((sum + h) mod 10) :: t
           | _ -> [sum / 10; sum mod 10]) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,16)-(14,59)
match x with
| (y , z) -> (let sum =
                y + z in
              match a with
              | h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
              | _ -> [sum / 10 ; sum mod 10])
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(14,40)-(14,59)
let sum = y + z in
match a with
| h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(14,41)-(14,42)
y
VarG

(14,41)-(14,42)
z
VarG

(14,41)-(14,42)
y + z
BopG VarG VarG

(14,41)-(14,42)
match a with
| h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

(14,44)-(14,58)
sum
VarG

(14,44)-(14,58)
h
VarG

(14,44)-(14,58)
(sum + h) / 10
BopG (BopG EmptyG EmptyG) LitG

(14,44)-(14,58)
sum + h
BopG VarG VarG

(14,44)-(14,58)
10
LitG

(14,44)-(14,58)
((sum + h) / 10) :: (((sum + h) mod 10) :: t)
ConAppG (Just (TupleG (fromList [BopG (BopG VarG VarG) LitG,ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG]))) Nothing]))) Nothing

(14,44)-(14,58)
((sum + h) mod 10) :: t
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG]))) Nothing

(14,49)-(14,50)
sum
VarG

(14,56)-(14,58)
h
VarG

(15,4)-(17,51)
t
VarG

(15,4)-(17,51)
sum
VarG

(15,4)-(17,51)
sum
VarG

(15,4)-(17,51)
sum / 10
BopG VarG LitG

(15,4)-(17,51)
sum mod 10
BopG VarG LitG

(15,4)-(17,51)
10
LitG

(15,4)-(17,51)
10
LitG

(15,4)-(17,51)
[sum / 10 ; sum mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(16,15)-(16,23)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(16,24)-(16,36)
List.rev
VarG

(16,24)-(16,36)
List.combine l1 l2
AppG (fromList [VarG])

*)
