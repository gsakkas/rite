
let rec wwhile (f,b) = match f b with | (h,t) -> if t = false then f b;;
