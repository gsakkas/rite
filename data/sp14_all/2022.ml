
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) =
      match a with
      | [] -> (x + y) :: a
      | h::t -> [(x + y) + (h / 10); h mod 10] @ t in
    let base = [] in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with
    | [] -> (mulByDigit x l2) :: a
    | h::t -> [bigAdd (mulByDigit x l2) [h / 10]; h mod 10] @ t in
  let base = [] in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) =
      match a with
      | [] -> (x + y) :: a
      | h::t -> [(x + y) + (h / 10); h mod 10] @ t in
    let base = [] in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with | [] -> mulByDigit x l2 | _ -> bigAdd a (mulByDigit x l2) in
  let base = [] in
  let args = List.rev l1 in let res = List.fold_left f base args in res;;

*)

(* changed spans
(38,5)-(40,64)
match a with
| [] -> mulByDigit x l2
| _ -> bigAdd a (mulByDigit x
                            l2)
CaseG VarG (fromList [(ConPatG Nothing,Nothing,AppG (fromList [EmptyG])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

(42,29)-(42,76)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) VarG

*)

(* type error slice
(15,3)-(15,58)
(15,9)-(15,10)
(15,37)-(15,47)
(15,37)-(15,49)
(15,57)-(15,58)
(17,4)-(26,37)
(17,12)-(26,35)
(17,15)-(26,35)
(18,3)-(26,35)
(26,3)-(26,13)
(26,3)-(26,35)
(28,4)-(34,76)
(28,20)-(34,74)
(28,22)-(34,74)
(29,3)-(34,74)
(33,3)-(34,74)
(34,3)-(34,74)
(34,35)-(34,45)
(34,35)-(34,74)
(37,3)-(42,76)
(37,9)-(40,64)
(38,5)-(40,64)
(38,11)-(38,12)
(39,13)-(39,30)
(39,13)-(39,35)
(39,14)-(39,24)
(39,34)-(39,35)
(40,15)-(40,60)
(40,15)-(40,64)
(40,16)-(40,22)
(40,16)-(40,49)
(40,42)-(40,43)
(40,42)-(40,48)
(40,51)-(40,59)
(40,61)-(40,62)
(40,63)-(40,64)
(42,29)-(42,76)
(42,43)-(42,57)
(42,43)-(42,69)
(42,58)-(42,59)
*)
