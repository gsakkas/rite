
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else (((clone 0 (abs diff)) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (arg1,arg2) = x in
      match a with
      | (0,_) ->
          if (arg1 + arg2) > 9
          then (1, [(arg1 + arg2) mod 10])
          else (0, [arg1 + arg2])
      | (_,_) ->
          if ((arg1 + arg2) + 1) > 9
          then (1, ([((arg1 + arg2) + 1) mod 10] @ a))
          else (0, (((arg1 + arg2) + 1) :: a)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else (((clone 0 (abs diff)) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (arg1,arg2) = x in
      match a with
      | (0,acc) ->
          if (arg1 + arg2) > 9
          then (1, (((arg1 + arg2) mod 10) :: acc))
          else (0, ((arg1 + arg2) :: acc))
      | (0,[]) ->
          if (arg1 + arg2) > 9
          then (1, [(arg1 + arg2) mod 10])
          else (0, [arg1 + arg2])
      | (_,acc) ->
          if ((arg1 + arg2) + 1) > 9
          then (1, ((((arg1 + arg2) + 1) mod 10) :: acc))
          else (0, (((arg1 + arg2) + 1) :: acc)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,7)-(27,47)
match a with
| (0 , acc) -> if (arg1 + arg2) > 9
               then (1 , ((arg1 + arg2) mod 10) :: acc)
               else (0 , (arg1 + arg2) :: acc)
| (0 , []) -> if (arg1 + arg2) > 9
              then (1 , [(arg1 + arg2) mod 10])
              else (0 , [arg1 + arg2])
| (_ , acc) -> if ((arg1 + arg2) + 1) > 9
               then (1 , (((arg1 + arg2) + 1) mod 10) :: acc)
               else (0 , ((arg1 + arg2) + 1) :: acc)
CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,IteG EmptyG EmptyG EmptyG),(TuplePatG (fromList [EmptyPatG]),Nothing,IteG EmptyG EmptyG EmptyG),(TuplePatG (fromList [EmptyPatG]),Nothing,IteG EmptyG EmptyG EmptyG)]

*)

(* type error slice
(17,5)-(30,52)
(17,11)-(27,47)
(17,13)-(27,47)
(18,7)-(27,47)
(19,7)-(27,47)
(19,13)-(19,14)
(21,11)-(23,34)
(23,16)-(23,34)
(26,20)-(26,54)
(26,50)-(26,51)
(26,52)-(26,53)
(30,19)-(30,33)
(30,19)-(30,45)
(30,34)-(30,35)
*)
