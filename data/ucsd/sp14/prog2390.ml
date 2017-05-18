
let rec clone x n =
  let rec helper a x n =
    if x <= 0 then [] else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let _ = clone clone (-3);;
