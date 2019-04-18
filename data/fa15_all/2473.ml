
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((out,sum),[]) -> (0, sum)
      | ((out,sum),(b,c)::l') ->
          let d = (b + c) + out in
          if d < 10 then (0, (d :: sum)) else (1, ((d - 10) :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          (match a with
           | (carry,sum) ->
               (match sum with
                | [] ->
                    if ((carry + b) + c) < 10
                    then (0, ([carry] @ [(carry + b) + c]))
                    else
                      ((carry + 1),
                        ([carry + 1] @ [((carry + b) + c) mod 10]))
                | h::t ->
                    if ((b + c) + h) < 10
                    then (0, ([0] @ ([(b + c) + h] @ t)))
                    else
                      ((carry + 1),
                        ([((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,7)-(22,69)
match x with
| (b , c) -> match a with
             | (carry , sum) -> match sum with
                                | [] -> if ((carry + b) + c) < 10
                                        then (0 , [carry] @ [(carry + b) + c])
                                        else (carry + 1 , [carry + 1] @ [((carry + b) + c) mod 10])
                                | h :: t -> if ((b + c) + h) < 10
                                            then (0 , [0] @ ([(b + c) + h] @ t))
                                            else (carry + 1 , [((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t))
CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,CaseG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))])

*)

(* type error slice
(17,5)-(25,52)
(17,11)-(22,69)
(17,13)-(22,69)
(18,7)-(22,69)
(18,13)-(18,19)
(18,17)-(18,18)
(24,5)-(25,52)
(24,16)-(24,24)
(24,16)-(24,45)
(24,25)-(24,45)
(24,26)-(24,38)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,41)-(25,45)
*)
