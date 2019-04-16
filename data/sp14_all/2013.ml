
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
(19,13)-(19,29)
fun (x , y) ->
  ((x + y) / 10) :: a
LamG (TuplePatG (fromList [VarPatG])) (ConAppG (Just EmptyG))

(20,16)-(20,17)
[]
ListG (fromList [])

(21,16)-(21,18)
List.combine l1 l2
AppG (fromList [VarG])

(21,22)-(21,69)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) VarG

*)

(* type error slice
(19,5)-(21,69)
(19,11)-(19,29)
(19,17)-(19,24)
(19,18)-(19,19)
(21,22)-(21,69)
(21,36)-(21,50)
(21,36)-(21,62)
(21,51)-(21,52)
*)
