
let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then h t;;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
