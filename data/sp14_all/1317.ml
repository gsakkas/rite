
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (_,h2::t2) ->
               let sum = (x1 + x2) + h2 in
               ((sum / 10), ((sum / 10) :: (sum mod 10) :: t2))
           | (_,_) -> (0, [0])) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = (bigAdd l l) + (mulByDigit (i - 1) l);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (_,h2::t2) ->
               let sum = (x1 + x2) + h2 in
               ((sum / 10), ((sum / 10) :: (sum mod 10) :: t2))
           | (_,_) -> (0, [0])) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | _ -> bigAdd (bigAdd l l) (mulByDigit (i - 1) l);;

*)

(* changed spans
(28,26)-(28,63)
match i with
| 0 -> []
| _ -> bigAdd (bigAdd l l)
              (mulByDigit (i - 1) l)
CaseG VarG (fromList [(LitPatG,Nothing,ListG (fromList [])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(11,37)-(11,75)
(11,51)-(11,61)
(11,51)-(11,63)
(11,69)-(11,75)
(13,4)-(26,37)
(13,12)-(26,35)
(13,15)-(26,35)
(14,3)-(26,35)
(26,3)-(26,13)
(26,3)-(26,35)
(28,26)-(28,38)
(28,26)-(28,63)
(28,27)-(28,33)
*)
