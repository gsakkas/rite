
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper acc n lis =
    match n with | 1 -> lis + acc | _ -> helper (n - 1) (bigAdd l lis) in
  helper [] i l;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper i l acc =
    match i with | 0 -> [0] | 1 -> l | _ -> helper (i - 1) l (bigAdd acc l) in
  helper i l [0];;

*)

(* changed spans
(27,17)-(28,70)
fun i ->
  fun l ->
    fun acc ->
      match i with
      | 0 -> [0]
      | 1 -> l
      | _ -> helper (i - 1) l
                    (bigAdd acc l)
LamG (LamG EmptyG)

(27,17)-(28,70)
fun l ->
  fun acc ->
    match i with
    | 0 -> [0]
    | 1 -> l
    | _ -> helper (i - 1) l
                  (bigAdd acc l)
LamG (LamG EmptyG)

(28,41)-(28,47)
i
VarG

(28,41)-(28,47)
l
VarG

(28,41)-(28,47)
helper (i - 1) l (bigAdd acc
                         l)
AppG [BopG EmptyG EmptyG,VarG,AppG [EmptyG,EmptyG]]

(28,41)-(28,47)
0
LitG

(28,41)-(28,47)
[0]
ListG LitG Nothing

(28,41)-(28,70)
match i with
| 0 -> [0]
| 1 -> l
| _ -> helper (i - 1) l
              (bigAdd acc l)
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,VarG),(Nothing,AppG [EmptyG,EmptyG,EmptyG])]

(28,49)-(28,50)
i
VarG

(28,56)-(28,70)
l
VarG

(28,64)-(28,65)
acc
VarG

*)
