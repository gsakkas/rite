
let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

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

let helper l1 l2 =
  let fn b y =
    let (u,(v,w)) = b in
    ((u + 1), (v, (((mulByDigit y l1) @ (clone 0 u)) :: w))) in
  let base = (0, (0, [])) in
  let (_,res) = List.fold_left fn (0, (0, [])) (List.rev 12) in res;;
