
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
      | [] ->
          if (arg1 + arg2) > 9
          then [1] @ ([(arg1 + arg2) mod 10] @ a)
          else (arg1 + arg2) :: a
      | h::t ->
          if ((arg1 + arg2) + h) > 9
          then [1] @ ([((arg1 + arg2) + h) mod 10] @ a)
          else ((arg1 + arg2) + h) :: a in
    let base = [] in
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
      | [] ->
          if (arg1 + arg2) > 9
          then [1] @ ([(arg1 + arg2) mod 10] @ a)
          else (arg1 + arg2) :: a
      | h::t ->
          if ((arg1 + arg2) + h) > 9
          then [1] @ ([((arg1 + arg2) + h) mod 10] @ a)
          else ((arg1 + arg2) + h) :: a in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(30,4)-(30,51)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

*)
