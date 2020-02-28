
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "TBD" in
    let base = (0, 0) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,17)-(18,31)
let z = fst x + snd x in
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
LetG NonRec [(VarPatG,BopG EmptyG EmptyG)] (CaseG EmptyG [(EmptyPatG,Nothing,EmptyG)])

(19,20)-(19,21)
[]
ListG []

*)

(* type error slice
(14,3)-(14,76)
(14,52)-(14,62)
(14,52)-(14,64)
(14,63)-(14,64)
(17,3)-(22,35)
(17,12)-(21,52)
(18,5)-(21,52)
(19,5)-(21,52)
(19,16)-(19,22)
(19,20)-(19,21)
(20,5)-(21,52)
(21,5)-(21,52)
(21,19)-(21,33)
(21,19)-(21,45)
(21,36)-(21,40)
(21,49)-(21,52)
(22,3)-(22,13)
(22,3)-(22,35)
(22,14)-(22,35)
(22,15)-(22,18)
*)
