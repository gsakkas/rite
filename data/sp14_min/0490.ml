
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | h::t -> a | [] -> a in
    let base = (0, 0) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let h::_ = a1 in
      let tens = (x1 + x2) + (h / 10) in
      let ones = (x1 + x2) + (h mod 10) in ((tens :: a1), (ones :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,17)-(19,51)
let (x1 , x2) = x in
let (a1 , a2) = a in
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(20,17)-(20,18)
[]
ListG []

(20,20)-(20,21)
[]
ListG []

*)

(* type error slice
(19,5)-(22,52)
(19,11)-(19,51)
(19,13)-(19,51)
(19,17)-(19,51)
(19,23)-(19,24)
(21,5)-(22,52)
(21,16)-(21,24)
(21,16)-(21,45)
(21,25)-(21,45)
(21,26)-(21,38)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,41)-(22,45)
*)
