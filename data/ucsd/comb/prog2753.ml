
let f x = 1;;

let f x = if x < 2 then 1 else x * (f (x - 1));;

let _ = let base d = d in List.fold_left f base fs;;
