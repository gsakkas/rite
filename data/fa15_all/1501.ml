
let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | [] ->
          (match x with
           | (x1,x2) when (x1 + x2) <= 9 -> 0 :: (x1 + x2) :: a
           | (x1,x2) when (x1 + x2) > 9 -> 1 :: ((x1 + x2) - 9) :: a)
      | h::t ->
          (match x with
           | (x1,x2) when ((x1 + x2) + h) <= 9 -> 0 :: ((x1 + x2) + h) :: t
           | (x1,x2) when ((x1 + x2) + h) > 9 -> 1 :: (((x1 + x2) + h) - 9)
               :: t) in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | [] -> (sum / 10) :: (sum mod 10) :: a
      | h::t -> (sum / 10) :: (h + (sum mod 10)) :: t in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,32)-(23,34)
fst
VarG

(23,32)-(23,34)
x
VarG

(23,32)-(23,34)
snd
VarG

(23,32)-(23,34)
x
VarG

(23,32)-(23,34)
snd x
AppG (fromList [VarG])

(23,32)-(23,34)
match a with
| [] -> (sum / 10) :: ((sum mod 10) :: a)
| h :: t -> (sum / 10) :: ((h + (sum mod 10)) :: t)
CaseG VarG (fromList [(Nothing,ConAppG (Just (TupleG (fromList [BopG VarG LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG (BopG VarG LitG)]))) Nothing]))) Nothing),(Nothing,ConAppG (Just (TupleG (fromList [BopG VarG LitG,ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing]))) Nothing)])

(23,49)-(23,63)
sum
VarG

(23,49)-(23,63)
10
LitG

(23,49)-(23,63)
let sum = fst x + snd x in
match a with
| [] -> (sum / 10) :: ((sum mod 10) :: a)
| h :: t -> (sum / 10) :: ((h + (sum mod 10)) :: t)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(23,55)-(23,57)
fst x
AppG (fromList [VarG])

(24,26)-(24,35)
sum
VarG

(24,26)-(24,35)
10
LitG

(24,43)-(24,44)
sum / 10
BopG VarG LitG

(24,61)-(24,62)
sum mod 10
BopG VarG LitG

(26,10)-(29,20)
sum
VarG

(26,10)-(29,20)
10
LitG

(27,45)-(27,46)
sum
VarG

(27,45)-(27,46)
10
LitG

(28,49)-(28,50)
sum / 10
BopG VarG LitG

(28,73)-(28,74)
sum mod 10
BopG VarG LitG

*)
