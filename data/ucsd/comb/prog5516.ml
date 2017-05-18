
let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let rec helper curList lt1 lt2 =
  match lt1 with
  | [] -> curList
  | h::t -> helper ((h, (List.hd lt2)) :: curList) t (List.tl lt2);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y
  then (((clone 0 (y - x)) @ l1), l2)
  else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | x::y -> if x = 0 then removeZero y else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (m,n) = a in let (o,p) = x in ((m + o), (n + p)) in
    let base = (0, 0) in
    let args = helper [] l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;
