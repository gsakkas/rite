
let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

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
    | h::t -> [(mulByDigit x l2) + (h / 10); h mod 10] @ t in
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
(15,5)-(17,59)
match a with
| [] -> mulByDigit x l2
| _ -> bigAdd a (mulByDigit x
                            l2)
CaseG VarG (fromList [(ConPatG Nothing,Nothing,AppG (fromList [EmptyG])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

(19,29)-(19,76)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) VarG

*)

(* type error slice
(3,3)-(3,58)
(3,9)-(3,10)
(3,37)-(3,47)
(3,37)-(3,49)
(3,57)-(3,58)
(5,4)-(11,76)
(5,20)-(11,74)
(5,22)-(11,74)
(6,3)-(11,74)
(10,3)-(11,74)
(11,3)-(11,74)
(11,35)-(11,45)
(11,35)-(11,74)
(14,3)-(19,76)
(14,9)-(17,59)
(15,5)-(17,59)
(15,11)-(15,12)
(16,13)-(16,30)
(16,13)-(16,35)
(16,14)-(16,24)
(16,34)-(16,35)
(17,15)-(17,55)
(17,15)-(17,59)
(17,16)-(17,33)
(17,16)-(17,44)
(17,17)-(17,27)
(17,36)-(17,44)
(17,37)-(17,38)
(17,56)-(17,57)
(19,29)-(19,76)
(19,43)-(19,57)
(19,43)-(19,69)
(19,58)-(19,59)
*)
