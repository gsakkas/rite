
let bigMul l1 l2 =
  let f a x = match a with | (i,acc) -> ([], acc) | _ -> failwith "wtf" in
  let base = (0, []) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else (l1, (List.append (clone 0 diff) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (([],_),y) -> (([], 0), y)
      | ((h::t,carry),y) ->
          let sum = (h + x) + carry in ((t, (sum / 10)), ((sum mod 10) :: y)) in
    let base = (((List.rev (0 :: l1)), 0), []) in
    let args = List.rev (0 :: l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec mulByDigit_RT i acc =
    if i = 0 then acc else mulByDigit_RT (i - 1) (bigAdd acc l) in
  mulByDigit_RT i [];;

let bigMul l1 l2 =
  let f a x =
    let (i,acc) = a in
    let digmul = mulByDigit (i * x) l2 in ((i * 10), (bigAdd digmul acc)) in
  let base = (1, []) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(3,15)-(3,72)
let (i , acc) = a in
let digmul =
  mulByDigit (i * x) l2 in
(i * 10 , bigAdd digmul acc)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(4,15)-(4,16)
1
LitG

*)

(* type error slice
(3,3)-(5,67)
(3,9)-(3,72)
(3,11)-(3,72)
(3,15)-(3,72)
(3,41)-(3,50)
(3,42)-(3,44)
(4,3)-(5,67)
(4,14)-(4,21)
(4,15)-(4,16)
(5,34)-(5,48)
(5,34)-(5,60)
(5,49)-(5,50)
(5,51)-(5,55)
*)
