
let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (z,y) ->
          let sum = z + y in
          if sum > 10
          then let result = (sum mod 10) :: a in 1 :: result
          else sum :: a in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (z,y) ->
          let sum = z + y in
          if sum > 10
          then let result = (sum mod 10) :: a in 1 :: result
          else sum :: a in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(26,5)-(26,52)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) VarG

*)

(* type error slice
(17,5)-(26,52)
(17,11)-(23,24)
(22,29)-(22,46)
(22,45)-(22,46)
(26,5)-(26,52)
(26,19)-(26,33)
(26,19)-(26,45)
(26,34)-(26,35)
*)
