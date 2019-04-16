
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let x = (h * i) mod 10 in
      let k = (h * i) / 10 in
      if k = 0 then k + (mulByDigit i t) else [x] @ (k + (mulByDigit i t));;


(* fix

let rec clone x n = if n < 1 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 < length2
  then (((clone 0 (length2 - length1)) @ l1), l2)
  else
    if length2 < length1
    then (l1, ((clone 0 (length1 - length2)) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else [h] @ t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (carry,rest) = a in
      ((((j + k) + carry) / 10), ([((j + k) + carry) mod 10] @ rest)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (car,res) = List.fold_left f base args in [car] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 2
  then l
  else (let total = bigAdd l l in bigAdd total (mulByDigit (i - 1) l));;

*)

(* changed spans
(3,3)-(8,75)
if i < 2
then l
else (let total =
        bigAdd l l in
      bigAdd total
             (mulByDigit (i - 1) l))
IteG (BopG EmptyG EmptyG) VarG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(2,4)-(8,77)
(2,20)-(8,75)
(2,22)-(8,75)
(3,3)-(8,75)
(4,11)-(4,13)
(8,7)-(8,75)
(8,21)-(8,41)
(8,25)-(8,41)
(8,26)-(8,36)
(8,47)-(8,75)
(8,51)-(8,52)
(8,53)-(8,75)
*)
