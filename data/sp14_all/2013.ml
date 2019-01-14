
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (a + x) / 10 in
    let base = 0 in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) = ((x + y) / 10) :: a in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,12)-(19,28)
fun (x , y) ->
  ((x + y) / 10) :: a
LamG (ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG]))) Nothing)

(19,16)-(19,28)
((x + y) / 10) :: a
ConAppG (Just (TupleG (fromList [VarG,BopG (BopG VarG VarG) LitG]))) Nothing

(19,26)-(19,28)
y
VarG

(20,4)-(21,68)
a
VarG

(20,15)-(20,16)
[]
ListG EmptyG Nothing

(21,15)-(21,17)
List.combine
VarG

(21,15)-(21,17)
l1
VarG

(21,15)-(21,17)
List.combine l1 l2
AppG (fromList [VarG])

(21,21)-(21,68)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)
