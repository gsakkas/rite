
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
(19,6)-(27,46)
(22,19)-(22,41)
(26,19)-(26,53)
(26,20)-(26,48)
(26,49)-(26,50)
(26,51)-(26,52)
(27,43)-(27,44)
(28,4)-(30,51)
(28,15)-(28,22)
(29,4)-(30,51)
(29,25)-(29,37)
(29,38)-(29,40)
(29,41)-(29,43)
(30,4)-(30,51)
(30,18)-(30,32)
(30,18)-(30,44)
(30,33)-(30,34)
(30,35)-(30,39)
(30,40)-(30,44)
(30,48)-(30,51)
(31,2)-(31,12)
(31,2)-(31,34)
(31,14)-(31,17)
(31,18)-(31,33)
(31,19)-(31,26)
(31,27)-(31,29)
(31,30)-(31,32)
*)

(* type error slice
(17,4)-(30,51)
(17,10)-(27,46)
(17,12)-(27,46)
(18,6)-(27,46)
(19,6)-(27,46)
(19,6)-(27,46)
(19,6)-(27,46)
(19,12)-(19,13)
(21,10)-(23,33)
(22,15)-(22,42)
(26,19)-(26,53)
(26,49)-(26,50)
(26,51)-(26,52)
(30,18)-(30,32)
(30,18)-(30,44)
(30,33)-(30,34)
*)
