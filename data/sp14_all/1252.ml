
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  add (padZero l1 l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with
      | (w,[]) -> (w, [z / 10; z mod 10])
      | (w,h::t) -> (((w + z) / 10), (((w + z) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  add (padZero l1 l2);;

*)

(* changed spans
(17,7)-(17,72)
match a with
| (w , []) -> (w , [z / 10 ; z mod 10])
| (w , h :: t) -> ((w + z) / 10 , ((w + z) mod 10) :: t)
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG,ConsPatG EmptyPatG EmptyPatG]),Nothing,TupleG (fromList [EmptyG])),(TuplePatG (fromList [VarPatG,ConPatG Nothing]),Nothing,TupleG (fromList [EmptyG]))])

(18,16)-(18,18)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

*)

(* type error slice
(15,5)-(20,52)
(15,11)-(17,72)
(17,7)-(17,72)
(17,13)-(17,14)
(18,5)-(20,52)
(18,16)-(18,18)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
(20,36)-(20,40)
*)
