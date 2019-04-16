
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let x = h * i in
      (match x with
       | x when x >= 10 -> (x / 10) :: ((x mod 10) + (mulByDigit i t))
       | _ -> x :: (mulByDigit i t));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [0] | _ -> bigAdd (bigAdd l l) (mulByDigit (i - 1) l);;

*)

(* changed spans
(3,3)-(9,37)
match i with
| 0 -> [0]
| _ -> bigAdd (bigAdd l l)
              (mulByDigit (i - 1) l)
CaseG VarG (fromList [(LitPatG,Nothing,ListG (fromList [EmptyG])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(2,4)-(9,39)
(2,20)-(9,37)
(2,22)-(9,37)
(3,3)-(9,37)
(6,7)-(9,37)
(7,7)-(9,37)
(8,28)-(8,71)
(8,40)-(8,71)
(8,54)-(8,70)
(8,55)-(8,65)
(9,15)-(9,36)
(9,20)-(9,36)
(9,21)-(9,31)
*)
