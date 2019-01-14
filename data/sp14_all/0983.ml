
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let x = (List.length l1) - (List.length l2) in
    let list_p = clone 0 x in (l1, (list_p @ l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let x = (List.length l2) - (List.length l1) in
       let list_p = clone 0 x in ((list_p @ l1), l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,listy) = a in
      let (num1,num2) = x in
      let initsum = (num1 + num2) + carry in
      if initsum > 9
      then (1, (listy @ [initsum mod 10]))
      else (0, (listy @ [initsum])) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (List.rev (add (padZero l1 l2)));;

let mulByDigit i l =
  let rec helpy p q carry accList =
    let numsList = List.rev q in
    match numsList with
    | [] -> [carry] @ accList
    | h::t ->
        let initMul = (h * p) + carry in
        let intKeep = initMul mod 10 in
        let carrying = (initMul - intKeep) / 10 in
        let v = List.rev t in (helpy p v carrying [intKeep]) @ accList in
  removeZero (helpy i l 0 []);;

let bigMul l1 l2 =
  let f a x =
    let (bottom_mult,total) = a in
    match bottom_mult with
    | [] -> total
    | h::t ->
        let newTotal = mulByDigit h x in
        let updateTotal = bigAdd newTotal total in (t, updateTotal) in
  let base = (l1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let x = (List.length l1) - (List.length l2) in
    let list_p = clone 0 x in (l1, (list_p @ l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let x = (List.length l2) - (List.length l1) in
       let list_p = clone 0 x in ((list_p @ l1), l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,listy) = a in
      let (num1,num2) = x in
      let initsum = (num1 + num2) + carry in
      if initsum > 9
      then (1, (listy @ [initsum mod 10]))
      else (0, (listy @ [initsum])) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (List.rev (add (padZero l1 l2)));;

let mulByDigit i l =
  let rec helpy p q carry accList =
    let numsList = List.rev q in
    match numsList with
    | [] -> [carry] @ accList
    | h::t ->
        let initMul = (h * p) + carry in
        let intKeep = initMul mod 10 in
        let carrying = (initMul - intKeep) / 10 in
        let v = List.rev t in (helpy p v carrying [intKeep]) @ accList in
  removeZero (helpy i l 0 []);;

let bigMul l1 l2 =
  let f a x =
    let (upper_mult,total) = a in
    let newTotal = mulByDigit x upper_mult in
    let updateTotal = bigAdd newTotal total in
    ((upper_mult @ [0]), updateTotal) in
  let base = (l1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(47,4)-(52,67)
let (upper_mult , total) =
  a in
let newTotal =
  mulByDigit x upper_mult in
let updateTotal =
  bigAdd newTotal total in
(upper_mult @ [0] , updateTotal)
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(52,8)-(52,67)
upper_mult
VarG

(52,52)-(52,53)
upper_mult @ [0]
AppG (fromList [VarG,ListG EmptyG Nothing])

(52,55)-(52,66)
upper_mult
VarG

(52,55)-(52,66)
(@)
VarG

(52,55)-(52,66)
0
LitG

(52,55)-(52,66)
[0]
ListG LitG Nothing

*)
