
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  let diff = leng1 - leng2 in
  if diff != 0
  then
    let zeros = clone 0 (abs diff) in
    (if diff < 0 then ((zeros @ l1), l2) else (l1, (zeros @ l2)))
  else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (cin,ls) ->
          (match x with
           | (a,b) ->
               let di = (cin + a) + b in ((di / 10), ((di mod 10) :: ls))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (co,res) = List.fold_left f base args in co :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if (i = 0) || (l = [])
  then []
  else
    (let rec helper i acc l = helper (i - 1) (bigAdd acc l) l in helper i []);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  let diff = leng1 - leng2 in
  if diff != 0
  then
    let zeros = clone 0 (abs diff) in
    (if diff < 0 then ((zeros @ l1), l2) else (l1, (zeros @ l2)))
  else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (cin,ls) ->
          (match x with
           | (a,b) ->
               let di = (cin + a) + b in ((di / 10), ((di mod 10) :: ls))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (co,res) = List.fold_left f base args in co :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if (i = 0) || (l = [])
  then []
  else
    (let rec helper i acc l = helper (i - 1) (bigAdd acc l) l in
     helper i [] l);;

*)

(* changed spans
(34,65)-(34,76)
helper i [] l
AppG (fromList [VarG,ListG EmptyG Nothing])

*)
