
let rec mulByDigit i l =
  if i <= 0
  then []
  else
    (let f a x =
       let (m,n) = a in
       let x = (x * i) + m in
       if x > 9
       then
         let y =
           let rec helper num carry =
             if num < 10 then carry else helper (num - 10) (carry + 1) in
           helper x 0 in
         (y, ((x - (y * 10)) :: n))
       else (0, (x :: n)) in
     let base = (0, []) in
     let args = List.rev l in
     let (z,res) = List.fold_left f base args in
     match z with | 0 -> res | _ -> z :: res);;

let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

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
    let f a x =
      let (m,n) = a in
      let (o,p) = x in
      let z = (o + p) + m in
      if z > 9 then (1, ((z - 10) :: n)) else (0, (z :: n)) in
    let base = (0, []) in
    let args =
      let rec helper curList lt1 lt2 =
        match lt1 with
        | [] -> curList
        | h::t -> helper ((h, (List.hd lt2)) :: curList) t (List.tl lt2) in
      helper [] l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let helper l1 l2 =
  let fn b y =
    let (u,v) = b in ((u + 1), (((mulByDigit y l1) @ (clone 0 u)) :: v)) in
  let (_,addList) = List.fold_left fn (0, []) (List.rev l2) in addList;;

let bigMul l1 l2 =
  let f a x = bigAdd a x in
  let base = [] in
  let args = helper l1 l2 in let (_,res) = List.fold_left f base args in res;;
