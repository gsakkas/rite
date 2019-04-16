
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | _ -> [a mod 10]
      | h::t -> ((a + h) mod 10) :: ((a + h) / 10) in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (add1,add2) ->
          let new_carry = ((carry + add1) + add2) / 10 in
          let digit = ((carry + add1) + add2) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,7)-(18,51)
let carry =
  match a with
  | (x , y) -> x in
match x with
| (add1 , add2) -> (let new_carry =
                      ((carry + add1) + add2) / 10 in
                    let digit =
                      ((carry + add1) + add2) mod 10 in
                    match a with
                    | (x , y) -> (new_carry , digit :: y))
LetG NonRec (fromList [(VarPatG,CaseG EmptyG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))]) (CaseG EmptyG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))

(19,16)-(19,18)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

(20,16)-(20,34)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(15,5)-(21,52)
(15,11)-(18,51)
(15,13)-(18,51)
(16,7)-(18,51)
(17,14)-(17,24)
(17,15)-(17,16)
(17,15)-(17,23)
(18,17)-(18,51)
(18,37)-(18,51)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
*)
