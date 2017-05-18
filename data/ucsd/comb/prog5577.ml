
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  let diff = leng1 - leng2 in
  if diff != 0
  then
    let zeros = clone 0 abs diff in
    (if diff < 0
     then List.combine (zeros @ l1) l2
     else List.combine l1 (zero @ l2))
  else List.combine l1 l2;;
