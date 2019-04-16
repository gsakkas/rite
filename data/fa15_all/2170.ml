
let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match l1 with | [] -> [] | h::t -> (0, ((x + h) :: a)) in
    let base = [] in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero (List.rev l1) (List.rev l2)));;


(* fix

let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      if sum > 9
      then (1, (((sum - 10) + (fst a)) :: (snd a)))
      else (0, ((sum + (fst a)) :: (snd a))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero (List.rev l1) (List.rev l2)));;

*)

(* changed spans
(17,17)-(17,71)
let sum = fst x + snd x in
if sum > 9
then (1 , ((sum - 10) + fst a) :: (snd a))
else (0 , (sum + fst a) :: (snd a))
LetG NonRec (fromList [(VarPatG,BopG EmptyG EmptyG)]) (IteG EmptyG EmptyG EmptyG)

(18,16)-(18,18)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

(19,16)-(19,18)
List.combine l1 l2
AppG (fromList [VarG])

*)

(* type error slice
(17,5)-(19,69)
(17,11)-(17,71)
(17,17)-(17,71)
(17,39)-(17,41)
(17,52)-(17,71)
(17,56)-(17,70)
(17,68)-(17,69)
(19,22)-(19,69)
(19,36)-(19,50)
(19,36)-(19,62)
(19,51)-(19,52)
*)
