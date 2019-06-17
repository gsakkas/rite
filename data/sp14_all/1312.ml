
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (_,h2::t2) ->
               let sum = (x1 + x2) + h2 in
               ((sum / 10), ((sum / 10) :: (sum mod 10) :: t2))
           | (_,_) -> (0, [0])) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | _ -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (l1',l2') = x in
    let (pos,total) = a in
    match l2' with
    | [] -> []
    | h::t -> ((pos + 1), (bigAdd (mulByDigit ((10 ** pos) * h) l2) total)) in
  let base = (0, [0]) in
  let args = ((List.rev l1), (List.rev l2)) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x = let (pos,total) = a in (pos, l2) in
  let base = (0, [0]) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(33,5)-(37,76)
let (pos , total) = a in
(pos , l2)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (TupleG [EmptyG,EmptyG])

(39,14)-(39,44)
List.rev l1
AppG [VarG]

*)

(* type error slice
(32,3)-(40,50)
(32,9)-(37,76)
(32,11)-(37,76)
(33,5)-(37,76)
(34,5)-(37,76)
(34,23)-(34,24)
(35,5)-(37,76)
(36,13)-(36,15)
(37,15)-(37,76)
(37,48)-(37,59)
(37,49)-(37,51)
(37,52)-(37,54)
(40,17)-(40,31)
(40,17)-(40,43)
(40,32)-(40,33)
*)
