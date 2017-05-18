
let pick_one n = if n > 0 then fun x  -> x + 1 else (fun x  -> x - 1);;

let _ = (pick_one - 5) 6;;
