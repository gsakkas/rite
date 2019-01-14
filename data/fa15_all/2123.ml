
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len = (List.length l1) - (List.length l2) in
  if len <= 0
  then (((clone 0 ((-1) * len)) @ l1), l2)
  else (l1, ((clone 0 len) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | x::l' -> (match x with | 0 -> removeZero l' | _ -> x :: l');;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (o,r) = a in
      ((((x1 + x2) + o) / 10), ((((x1 + x2) + o) mod 10) :: r)) in
    let base = (0, []) in
    let args =
      List.rev (List.combine ((clone 0 1) :: l1) ((clone 0 1) :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len = (List.length l1) - (List.length l2) in
  if len <= 0
  then (((clone 0 ((-1) * len)) @ l1), l2)
  else (l1, ((clone 0 len) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | x::l' -> (match x with | 0 -> removeZero l' | _ -> x :: l');;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (o,r) = a in
      ((((x1 + x2) + o) / 10), ((((x1 + x2) + o) mod 10) :: r)) in
    let base = (0, []) in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,31)-(23,36)
(0 , 0)
TupleG (fromList [LitG])

(23,59)-(23,60)
List.combine l1 l2
AppG (fromList [VarG])

(23,65)-(23,67)
List.combine
VarG

(23,65)-(23,67)
l1
VarG

*)
